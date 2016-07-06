# == Schema Information
#
# Table name: news
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text(65535)
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  summary     :text(65535)
#
# Indexes
#
#  index_news_on_activity_id  (activity_id)
#

class News < ActiveRecord::Base
  belongs_to :activity

  has_one :paper, -> { where paper_type: "paper" }, class_name: "Paper", as: :paperable, dependent: :destroy
  accepts_nested_attributes_for :paper, allow_destroy: true
  
end
