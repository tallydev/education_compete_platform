# == Schema Information
#
# Table name: info_competition_opuses
#
#  id         :integer          not null, primary key
#  recruit_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content    :string
#
# Indexes
#
#  index_info_competition_opuses_on_recruit_id  (recruit_id)
#

require 'rails_helper'

RSpec.describe InfoCompetition::Opus, type: :model do
  it { should belong_to(:recruit) } 

  it { should have_one(:media) } 
  it { should have_one(:ppt) } 
  it { should have_one(:note) } 
end
