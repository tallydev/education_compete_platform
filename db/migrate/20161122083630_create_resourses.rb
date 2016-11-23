class CreateResourses < ActiveRecord::Migration
  def change
    create_table :resourses do |t|
      t.string :type
      t.string :resourse_type
      t.integer :catalog

      t.timestamps null: false
    end
  end
end
