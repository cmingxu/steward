# == Schema Information
#
# Table name: steward_page_widgets
#
#  id             :integer          not null, primary key
#  widget_type    :integer
#  label          :string(255)
#  options        :text
#  steward_kpi_id :integer
#  param          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'rails_helper'

RSpec.describe StewardPageWidget, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
