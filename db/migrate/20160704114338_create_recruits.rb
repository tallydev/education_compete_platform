class CreateRecruits < ActiveRecord::Migration
  def change
    create_table :recruits do |t|
      t.references :activities, index: true
      t.references :player, index: true
      
      t.timestamps null: false
    end
  end
end
