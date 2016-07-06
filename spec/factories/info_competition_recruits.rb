# == Schema Information
#
# Table name: info_competition_recruits
#
#  id          :integer          not null, primary key
#  player_id   :integer
#  school_id   :integer
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_info_competition_recruits_on_activity_id  (activity_id)
#  index_info_competition_recruits_on_player_id    (player_id)
#  index_info_competition_recruits_on_school_id    (school_id)
#

FactoryGirl.define do
  factory :info_competition_recruit, class: 'InfoCompetition::Recruit' do
    player nil
    school nil
    activity nil
  end
end
