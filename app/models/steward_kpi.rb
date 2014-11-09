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
#

class StewardKpi < ActiveRecord::Base
  enum code_type: [:sql, :code]
  enum query_plan: [:realtime, :cached]

  has_ancestry
  has_many :steward_page_widgets
  accepts_nested_attributes_for :steward_page_widgets, allow_destroy: true

  default_scope { order(:position) }

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

      subtree = { label: c.resource, data: { url: "test" } }
      unless c.has_children?
        subtree[:data][:controls] = c.steward_page_widgets.map do |spw|
          {
            label: spw.label,
            type: spw.widget_type,
            options: spw.options,
            param_name: spw.param
          }
        end
      end
      hash[:children] ||= []
      hash[:children] << subtree
      self.depth_first_iteration(c, subtree)
    end
  end

end
