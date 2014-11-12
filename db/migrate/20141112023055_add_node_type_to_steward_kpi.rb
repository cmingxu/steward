class AddNodeTypeToStewardKpi < ActiveRecord::Migration
  def change
    add_column :steward_kpis, :node_type, :integer
  end
end
