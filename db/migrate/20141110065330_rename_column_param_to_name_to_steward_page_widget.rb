class RenameColumnParamToNameToStewardPageWidget < ActiveRecord::Migration
  def change
    rename_column :steward_page_widgets, :param, :name
  end
end
