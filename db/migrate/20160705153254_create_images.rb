class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :type
      t.string :photo_type
      t.references :imageable, polymorphic: true, index: true
      t.attachment :file

      t.timestamps null: false
    end
  end
end