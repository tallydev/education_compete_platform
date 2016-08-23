class AddOfflineToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :offline, :boolean
  end
end
