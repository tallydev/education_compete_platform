# == Schema Information
#
# Table name: training_course_teachers
#
#  id                 :integer          not null, primary key
#  teacher_id         :integer
#  training_course_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_training_course_teachers_on_teacher_id          (teacher_id)
#  index_training_course_teachers_on_training_course_id  (training_course_id)
#

class TrainingCourseTeacher < ActiveRecord::Base
end
