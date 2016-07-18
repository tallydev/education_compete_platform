class CreatePlayerInfos < ActiveRecord::Migration
  def change
    create_table :player_infos do |t|
      t.string :name
      t.string :card_number
      t.string :address
      t.string :code
      t.integer :sex
      t.string :nation
      t.references :player, index: true
      t.references :school, index: true
      t.timestamps null: false
    end
  end
end
