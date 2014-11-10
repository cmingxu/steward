# == Schema Information
#
# Table name: steward_page_widgets
#
#  id             :integer          not null, primary key
#  widget_type    :integer
#  label          :string(255)
#  options        :text
#  steward_kpi_id :integer
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class StewardPageWidget < ActiveRecord::Base
  belongs_to :steward_kpi
  enum widget_type: [:dropdown, :text, :radio, :checkbox]
end
