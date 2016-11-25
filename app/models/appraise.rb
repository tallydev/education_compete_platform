# == Schema Information
#
# Table name: appraises
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  teacher_id         :integer
#  remark             :text(65535)
#  degree             :string(255)
#  training_course_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_appraises_on_teacher_id          (teacher_id)
#  index_appraises_on_training_course_id  (training_course_id)
#  index_appraises_on_user_id             (user_id)
#

class Appraise < ActiveRecord::Base
end
