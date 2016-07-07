# == Schema Information
#
# Table name: talk_competition_recruits
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
#  index_talk_competition_recruits_on_activity_id  (activity_id)
#  index_talk_competition_recruits_on_player_id    (player_id)
#  index_talk_competition_recruits_on_school_id    (school_id)
#

class TalkCompetition::Recruit < ActiveRecord::Base
  include RecruitConcern
  
  belongs_to :player
  belongs_to :school
  belongs_to :activity
end