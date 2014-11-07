class StewardKpi < ActiveRecord::Base
  enum code_type: [:sql, :code]
  enum query_plan: [:realtime, :cached]

  has_ancestry
  has_many :steward_page_widgets
  accepts_nested_attributes_for :steward_page_widgets

  default_scope { order(:position) }

  scope :all_roots, -> { where(:ancestry => nil) }
end
