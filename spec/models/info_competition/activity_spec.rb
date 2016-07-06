# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default(0)
#  type       :string
#

require 'rails_helper'

RSpec.describe InfoCompetition::Activity, type: :model do
  it { should have_many(:recruits) } 
  it { should have_many(:players).through(:recruits) } 

  describe "Activity & Recruit & Player" do
    let(:school) { create(:school) }
    let(:activity) { create(:info_competition_activity) }
    let(:player) { create(:player, school: school) }
    
    it 'should set school before_save' do
      recruit = activity.recruits.build(player: player)
      recruit.save
      activity.reload
      expect(activity.players.last).to eq player
    end

    it 'should set school before_save' do
      recruit = activity.recruits.build(player: player)
      recruit.save
      activity.reload
      expect(recruit.school).to eq school
    end

  end
end
