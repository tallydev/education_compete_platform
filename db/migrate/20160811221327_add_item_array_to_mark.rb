class AddItemArrayToMark < ActiveRecord::Migration
  def change
    add_column :marks, :item_array, :text
  end
end
