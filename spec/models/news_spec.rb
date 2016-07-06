# == Schema Information
#
# Table name: news
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  summary     :text
#
# Indexes
#
#  index_news_on_activity_id  (activity_id)
#

require 'rails_helper'

RSpec.describe News, type: :model do
  it { should belong_to(:activity) } 
end
