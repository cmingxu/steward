class CreateStewardKpis < ActiveRecord::Migration
  def change
    create_table :steward_kpis do |t|
      t.text :code
      t.string :resource
      t.integer :code_type
      t.integer :query_plan
      t.integer :position
      t.string :ancestry

      t.timestamps
    end
  end
end
