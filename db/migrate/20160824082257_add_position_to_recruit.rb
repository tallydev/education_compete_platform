class AddPositionToRecruit < ActiveRecord::Migration
  def change
    add_column :info_competition_recruits, :position, :integer
    add_column :talk_competition_recruits, :position, :integer
  end
end
