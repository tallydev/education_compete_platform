class CreatePlayerTrainingCourses < ActiveRecord::Migration
  def change
    create_table :player_training_courses do |t|
      t.references :player, index: true
      t.references :training_course, index: true
      t.string :aasm_state
      t.text :remark
      t.string :certificate_no

      t.timestamps null: false
    end
  end
end
