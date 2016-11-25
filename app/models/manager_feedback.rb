# == Schema Information
#
# Table name: manager_feedbacks
#
#  id                  :integer          not null, primary key
#  school_user_id      :integer
#  training_course_id  :integer
#  organizer           :string(255)
#  total_hours         :string(255)
#  total_expenses      :string(255)
#  total_expenses_info :text(65535)
#  feedback            :text(65535)
#  remark              :text(65535)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_manager_feedbacks_on_school_user_id      (school_user_id)
#  index_manager_feedbacks_on_training_course_id  (training_course_id)
#

class ManagerFeedback < ActiveRecord::Base
end
