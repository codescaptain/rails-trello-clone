class AddPositionColumnToLists < ActiveRecord::Migration[7.0]
  def up
    add_column :lists, :position, :integer
    change_column_default :lists, :position, 0
  end

  def down
    remove_column :lists, :position
  end
end
