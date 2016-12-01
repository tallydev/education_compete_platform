class ChangeTask < ActiveRecord::Migration
  def change
  	change_table :tasks do |t|
  	  t.string :title
  	  t.text :body
  	  t.integer :submit_player_count
  	  t.references :training_course, index: true
      t.references :admin, index: true
  	end
  end
end
