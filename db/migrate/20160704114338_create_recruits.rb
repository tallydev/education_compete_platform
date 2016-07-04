class CreateRecruits < ActiveRecord::Migration
  def change
    create_table :recruits do |t|
      t.references :activities
      t.references :players
      
      t.timestamps null: false
    end
  end
end
