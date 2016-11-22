class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :type
      t.string :sound_type
      t.references :resourse,index: true, foreign_key: true
      t.attachment :file
      t.references :soundable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
