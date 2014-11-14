class AddLabelsToStewardKpi < ActiveRecord::Migration
  def change
    add_column :steward_kpis, :labels, :text
  end
end
