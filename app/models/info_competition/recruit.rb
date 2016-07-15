# == Schema Information
#
# Table name: info_competition_recruits
#
#  id            :integer          not null, primary key
#  player_id     :integer
#  school_id     :integer
#  activity_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  project       :string(255)
#  name          :string(255)
#  version       :string(255)
#  comment       :text(65535)
#  cooperater_1  :string(255)
#  school_1      :string(255)
#  course_1      :string(255)
#  cooperater_2  :string(255)
#  school_2      :string(255)
#  course_2      :string(255)
#  cooperater_3  :string(255)
#  school_3      :string(255)
#  course_3      :string(255)
#  school_person :string(255)
#  school_phone  :string(255)
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

  def player_info
    player.try(:player_info)
  end

  # delegate :phone, : to: :player_info
  
end
