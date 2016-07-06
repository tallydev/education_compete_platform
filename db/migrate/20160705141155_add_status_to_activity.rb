class AddStatusToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :status, :integer, default: 0
  end
end
