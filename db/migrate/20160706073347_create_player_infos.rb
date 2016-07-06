class CreatePlayerInfos < ActiveRecord::Migration
  def change
    create_table :player_infos do |t|
      t.string :name
      t.string :card_number
      t.string :address
      t.string :code
      t.integer :sex
      t.string :nation
      t.references :player, index: true, foreign_key: true
      t.references :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
