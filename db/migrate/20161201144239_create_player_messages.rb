class CreatePlayerMessages < ActiveRecord::Migration
  def change
    create_table :player_messages do |t|
      t.references :player, index: true, foreign_key: true
      t.references :message, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
