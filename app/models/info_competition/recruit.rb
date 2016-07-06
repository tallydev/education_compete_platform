# == Schema Information
#
# Table name: info_competition_recruits
#
#  id           :integer          not null, primary key
#  player_id    :integer
#  school_id    :integer
#  activity_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  project      :string
#  name         :string
#  version      :string
#  comment      :text
#  cooperater_1 :string
#  school_1     :string
#  course_1     :string
#  cooperater_2 :string
#  school_2     :string
#  course_2     :string
#  cooperater_3 :string
#  school_3     :string
#  course_3     :string
#
# Indexes
#
#  index_info_competition_recruits_on_activity_id  (activity_id)
#  index_info_competition_recruits_on_player_id    (player_id)
#  index_info_competition_recruits_on_school_id    (school_id)
#

class InfoCompetition::Recruit < ActiveRecord::Base
  include RecruitConcern

  belongs_to :player
  belongs_to :school
  belongs_to :activity
  
end
