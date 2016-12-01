class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.references :player, index: true, foreign_key: true
      t.references :training_course, index: true, foreign_key: true
      t.string :title
      t.text :content
      t.datetime :add_date

      t.timestamps null: false
    end
  end
end
