# == Schema Information
#
# Table name: player_training_courses
#
#  id                 :integer          not null, primary key
#  player_id          :integer
#  training_course_id :integer
#  aasm_state         :string(255)
#  remark             :text(65535)
#  certificate_no     :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_player_training_courses_on_player_id           (player_id)
#  index_player_training_courses_on_training_course_id  (training_course_id)
#

class PlayerTrainingCourse < ActiveRecord::Base
end
