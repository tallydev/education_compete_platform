class AddAttrsToPlayerInfo < ActiveRecord::Migration
  def change
    add_column :player_infos, :birth, :date
    add_column :player_infos, :professional_title, :string
    add_column :player_infos, :degree, :string
    add_column :player_infos, :special, :string
  end
end
