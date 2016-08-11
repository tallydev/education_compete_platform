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
#  project       :string
#  name          :string
#  version       :string
#  comment       :text
#  cooperater_1  :string
#  school_1      :string
#  course_1      :string
#  cooperater_2  :string
#  school_2      :string
#  course_2      :string
#  cooperater_3  :string
#  school_3      :string
#  course_3      :string
#  school_person :string
#  school_phone  :string
#
# Indexes
#
#  index_info_competition_recruits_on_activity_id  (activity_id)
#  index_info_competition_recruits_on_player_id    (player_id)
#  index_info_competition_recruits_on_school_id    (school_id)
#

require 'rails_helper'

RSpec.describe InfoCompetition::Recruit, type: :model do
  it { should belong_to(:player) } 
  it { should belong_to(:school) } 
  it { should belong_to(:activity) } 
  it { should have_many(:marks) } 

  it { should validate_presence_of(:player) }
  it { should validate_presence_of(:activity) }
  it { should validate_uniqueness_of(:player_id).scoped_to(:activity_id) }
end
