class CreateStewardPageWidgets < ActiveRecord::Migration
  def change
    create_table :steward_page_widgets do |t|
      t.integer :widget_type
      t.string :label
      t.text :options
      t.references :steward_kpi

      t.timestamps
    end
  end
end
