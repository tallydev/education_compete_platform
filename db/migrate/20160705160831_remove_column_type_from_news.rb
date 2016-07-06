class RemoveColumnTypeFromNews < ActiveRecord::Migration
  def change
    remove_column :news, :type
  end
end
