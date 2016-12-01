class CreatePlayerTasks < ActiveRecord::Migration
  def change
    create_table :player_tasks do |t|
      t.string :title
      t.text :content
      t.string :appraise
      t.references :task, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
