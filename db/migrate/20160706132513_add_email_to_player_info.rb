class AddEmailToPlayerInfo < ActiveRecord::Migration
  def change
    add_column :player_infos, :email, :string
  end
end
