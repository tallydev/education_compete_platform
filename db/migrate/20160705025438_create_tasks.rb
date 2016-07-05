class CreateTasks < ActiveRecord::Migration
  
  def change
    create_table :tasks do |t|
      t.references :mark, index: true
      t.references :expert, index: true
      t.references :recruit, index: true
      
      t.timestamps null: false
    end
  end

end
