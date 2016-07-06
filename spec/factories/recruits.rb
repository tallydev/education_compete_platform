# == Schema Information
#
# Table name: recruits
#
#  id            :integer          not null, primary key
#  activities_id :integer
#  player_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_recruits_on_activities_id  (activities_id)
#  index_recruits_on_player_id      (player_id)
#

FactoryGirl.define do
  factory :recruit do
    
  end
end
