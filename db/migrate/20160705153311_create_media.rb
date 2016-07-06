class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :type
      t.string :media_type
      t.references :mediaable, polymorphic: true, index: true
      t.attachment :file
      
      t.timestamps null: false
    end
  end
end
