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
#

FactoryGirl.define do
  factory :steward_kpi do
    code "MyText"
resource "MyString"
code_type 1
query_plan 1
position 1
ancestry "MyString"
  end

end
