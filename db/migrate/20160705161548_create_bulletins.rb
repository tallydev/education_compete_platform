class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.string :title
      t.text :content
      t.references :activity, index: true
      
      t.timestamps null: false
    end
  end
end
