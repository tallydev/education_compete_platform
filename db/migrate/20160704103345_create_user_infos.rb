class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :name, null: false
      t.integer :id_card_type
      t.string :id_card
      t.string :nation
      t.string :gender
      t.string :tel
      t.references :player, index: true

      t.timestamps null: false
    end
  end
end
