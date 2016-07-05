# == Schema Information
#
# Table name: news
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text(65535)
#  type        :integer          default(0)
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_news_on_activity_id  (activity_id)
#

class News < ActiveRecord::Base
  belongs_to :activity
  enum type: [:news, :bulletin]
  
end
