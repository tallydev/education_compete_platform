class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.float :score
      t.references :recruit, index: true
      

      t.timestamps null: false
    end
  end
end
