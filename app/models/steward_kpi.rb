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

  scope :all_roots, -> { where(:ancestry => nil) }
end
