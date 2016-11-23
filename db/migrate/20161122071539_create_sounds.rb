class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :type
      t.string :sound_type
      t.integer :resourse_id
      t.attachment :file
      t.references :soundable, polymorphic: true

      t.timestamps null: false
    end
  end
end
