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

require 'rails_helper'

RSpec.describe StewardKpi, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
