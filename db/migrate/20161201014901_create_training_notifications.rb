class CreateTrainingNotifications < ActiveRecord::Migration
  def change
    create_table :training_notifications do |t|
      t.string :title
      t.string :sub_title
      t.integer :view_count, default: 0
      t.string :author
      t.text :content
      t.string :category

      t.timestamps null: false
    end
  end
end
