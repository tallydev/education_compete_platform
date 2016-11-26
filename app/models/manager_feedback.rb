# == Schema Information
#
# Table name: manager_feedbacks
#
#  id                  :integer          not null, primary key
#  admin_id            :integer
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
#  index_manager_feedbacks_on_admin_id            (admin_id)
#  index_manager_feedbacks_on_training_course_id  (training_course_id)
#
# Foreign Keys
#
#  fk_rails_2ddaa268eb  (training_course_id => training_courses.id)
#  fk_rails_4c6f6ff238  (admin_id => admins.id)
#

class ManagerFeedback < ActiveRecord::Base
end