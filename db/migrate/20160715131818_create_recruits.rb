class CreateRecruits < ActiveRecord::Migration
  def change
    create_table :recruits do |t|
      t.references :activity, index: true
      t.references :opu, index: true
      
      t.timestamps null: false
    end
  end
end
