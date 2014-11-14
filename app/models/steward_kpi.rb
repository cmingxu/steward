# == Schema Information
#
# Table name: steward_kpis
#
#  id         :integer          not null, primary key
#  code       :text
#  resource   :string(255)
#  code_type  :integer
#  query_plan :integer
#  position   :integer
#  ancestry   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  node_type  :integer
#  labels     :text
#

class StewardKpi < ActiveRecord::Base
  enum code_type: [:sql, :code]
  enum query_plan: [:realtime, :cached]
  enum node_type: [:category, :kpi]

  has_ancestry
  has_many :steward_page_widgets
  accepts_nested_attributes_for :steward_page_widgets, allow_destroy: true

  #default_scope { order(:position) }

  def self.to_nav_tree
    [].tap do |nav_tree|
      self.roots.each do |r|
        subtree = { label: r.resource }
        self.depth_first_iteration(r, subtree)
        nav_tree << subtree
      end
    end
  end

  def self.depth_first_iteration(node, hash)
    return unless node.has_children?
    node.children.each do |c|

      subtree = { label: c.resource, data: { url: "http://localhost:3000/steward_kpis/#{c.id}" } }
      unless c.has_children?
        subtree[:data][:controls] = c.steward_page_widgets.map do |spw|
          {
            label: spw.label,
            type: spw.widget_type,
            options: spw.options.split(', ').map{|h| h1,h2 = h.split(':'); {h1.strip => h2.strip}}.reduce(:merge),
            name: spw.name
          }
        end
      end
      hash[:children] ||= []
      hash[:children] << subtree
      self.depth_first_iteration(c, subtree)
    end
  end

  def generate_plan(query_params)
    self.code % query_params
  end

  def test_run
    test_params = Hash[*self.steward_page_widgets.map{|spw| [spw.label, spw.options.split(/\W+/)[0]]}.flatten]
    test_params.symbolize_keys!
    begin
      sql_statement = generate_plan(test_params)
      res = Conn.query(sql_statement.sub(/limit \d+/, "LIMIT 1"))
      [true, "SQL statement:  [ #{sql_statement} ] passed, results are [#{res.inspect}]"]
    rescue Mysql2::Error => e
      [false,
       "SQL Error:  [ #{sql_statement} ] Error:  "  + e.message]
    rescue Exception => e
      [false,
       "Error:  "  + e.message]
    end
  end

  def query_kpi_data(query_params)
    logger.info query_params
    logger.info self.code

    data_labels = self.labels.split(', ')
    results = Conn.query(generate_plan(query_params))
    datasets = results.each(as: :array).each_with_index.map do |data, i|
      {label: data_labels[i], data: data}
    end
    return { labels: results.fields, datasets: datasets }
    # return { labels:['test1', 'test2', 'test3'], datasets:[{label: "label 1", data: [3,3,4]}, {label: "label 2", data: [2,3,4]}]}
  end

  def is_kpi?
    self.node_type.to_sym == :kpi
  end

end
