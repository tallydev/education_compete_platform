class CreateOpus < ActiveRecord::Migration
  def change
    create_table :opus do |t|
      t.string :type
      t.attachment :file
      
      t.timestamps null: false
    end
  end
end
