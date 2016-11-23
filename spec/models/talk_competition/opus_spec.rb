# == Schema Information
#
# Table name: talk_competition_opuses
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  recruit_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_talk_competition_opuses_on_recruit_id  (recruit_id)
#

require 'rails_helper'

RSpec.describe TalkCompetition::Opus, type: :model do
  it { should belong_to(:recruit) } 

  it { should have_one(:media) } 
  it { should have_one(:ppt) } 
  it { should have_one(:note) } 
  it { should have_one(:plan) } 
end
