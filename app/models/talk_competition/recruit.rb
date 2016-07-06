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
# Foreign Keys
#
#  fk_rails_6d2d0e9c4d  (activity_id => activities.id)
#  fk_rails_7b0a6c0542  (school_id => schools.id)
#  fk_rails_fb78ac0920  (player_id => players.id)
#

class TalkCompetition::Recruit < ActiveRecord::Base
  include RecruitConcern
  
  belongs_to :player
  belongs_to :school
  belongs_to :activity
end
