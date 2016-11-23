class CreateResourceLibraries < ActiveRecord::Migration
  def change
    create_table :resource_libraries do |t|
      t.string :title
      t.integer :catalog
      t.string :mdate

      t.timestamps null: false
    end
  end
end
