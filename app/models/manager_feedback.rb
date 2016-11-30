# == Schema Information
#
# Table name: manager_feedbacks
#
#  id                  :integer          not null, primary key
#  manager_id          :integer
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
#  index_manager_feedbacks_on_manager_id          (manager_id)
#  index_manager_feedbacks_on_training_course_id  (training_course_id)
#
# Foreign Keys
#
#  fk_rails_2ddaa268eb  (training_course_id => training_courses.id)
#  fk_rails_a6947f89ef  (manager_id => admins.id)
#

class ManagerFeedback < ActiveRecord::Base
  belongs_to :manager
  belongs_to :training_course

  #搜索功能
  scope :keyword, -> (keyword) do
    return all if keyword.blank?
    joins(:manager).joins(:training_course).where(
      'managers.name LIKE ?
      OR manager_feedbacks.organizer LIKE ?
      OR training_courses.name LIKE ?',
      "%#{keyword}%",
      "%#{keyword}%",
      "%#{keyword}%"
    )
  end
end







