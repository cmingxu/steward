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

FactoryGirl.define do
  factory :steward_page_widget do
    widget_type 1
label "MyString"
options "MyText"
steward_kpi nil
param "MyString"
  end

end
