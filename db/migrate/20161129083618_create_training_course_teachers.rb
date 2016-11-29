class CreateTrainingCourseTeachers < ActiveRecord::Migration
  def change
    create_table :training_course_teachers do |t|
      t.references :teacher, index: true
      t.references :training_course, index: true

      t.timestamps null: false
    end
  end
end
