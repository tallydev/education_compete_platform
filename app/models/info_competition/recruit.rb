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
# Foreign Keys
#
#  fk_rails_4d26a3dde0  (activity_id => activities.id)
#  fk_rails_e9f4dc1858  (player_id => players.id)
#  fk_rails_f14689aa2f  (school_id => schools.id)
#

class InfoCompetition::Recruit < ActiveRecord::Base
  include RecruitConcern

  belongs_to :player
  belongs_to :school
  belongs_to :activity
  
end
