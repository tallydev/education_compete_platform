# == Schema Information
#
# Table name: talk_competition_recruits
#
#  id            :integer          not null, primary key
#  player_id     :integer
#  school_id     :integer
#  activity_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  school_person :string
#  school_phone  :string
#  name          :string
#  comment       :text
#  work_time     :string
#
# Indexes
#
#  index_talk_competition_recruits_on_activity_id  (activity_id)
#  index_talk_competition_recruits_on_player_id    (player_id)
#  index_talk_competition_recruits_on_school_id    (school_id)
#

class TalkCompetition::Recruit < ActiveRecord::Base
  include RecruitConcern
  has_one :opus
  
  belongs_to :player
  belongs_to :school
  belongs_to :activity

  has_many :marks, as: :recruitable, dependent: :destroy
  has_many :experts, through: :marks

  def player_info
    player.try(:player_info)
  end
end
