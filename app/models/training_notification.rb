# == Schema Information
#
# Table name: training_notifications
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  sub_title  :string(255)
#  view_count :integer          default(0)
#  author     :string(255)
#  content    :text(65535)
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TrainingNotification < ActiveRecord::Base
  has_one :training_course
  # has_one :attachment, as: :attachmentable
  default_scope { order("created_at DESC") }
  scope :find_category, -> (params) {where(category: params)}

  enum category: {
	country: '0',
	teacher: '1',
	manager: '2'
  }

  ListCategory = {
	country: '国培培训',
	teacher: '骨干教师培训',
	manager: '专业负责人培训'
  }

  scope :keyword, -> (keyword) do
    return all if keyword.blank?
    where("notifications.title like ?
    OR notifications.author like ?",
    "%#{keyword}%", 
    "%#{keyword}%")
  end
end
