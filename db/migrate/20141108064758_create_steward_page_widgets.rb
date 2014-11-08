class CreateStewardPageWidgets < ActiveRecord::Migration
  def change
    create_table :steward_page_widgets do |t|
      t.integer :widget_type
      t.string :label
      t.text :options
      t.references :steward_kpi, index: true
      t.string :param

      t.timestamps
    end
  end
end
