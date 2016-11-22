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
#  school_person :string(255)
#  school_phone  :string(255)
#  name          :string(255)
#  comment       :text(65535)
#  work_time     :string(255)
#  total_score   :integer          default(0)
#  avg_score     :float(24)
#  score_count   :integer
#  position      :integer
#
# Indexes
#
#  index_talk_competition_recruits_on_activity_id  (activity_id)
#  index_talk_competition_recruits_on_player_id    (player_id)
#  index_talk_competition_recruits_on_school_id    (school_id)
#

require 'rails_helper'

RSpec.describe TalkCompetition::Recruit, type: :model do
  it { should belong_to(:player) } 
  it { should belong_to(:school) } 
  it { should belong_to(:activity) } 

  it { should validate_presence_of(:player) }
  it { should validate_presence_of(:activity) }
  it { should validate_uniqueness_of(:player_id).scoped_to(:activity_id) }
end
