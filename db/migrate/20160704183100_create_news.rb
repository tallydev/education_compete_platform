class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.integer :type, default: 0
      t.references :activity, index: true
      
      t.timestamps null: false
    end
  end
end
