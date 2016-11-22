# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default(0)
#  type       :string(255)
#  short_name :string(255)
#  offline    :boolean
#

require 'rails_helper'

RSpec.describe InfoCompetition::Activity, type: :model do
  it { should have_many(:recruits) } 
  it { should have_many(:players).through(:recruits) } 

  describe "Activity & Recruit & Player" do
    let(:school) { create(:school) }
    let(:school1) { create(:school) }
    let(:activity) { create(:info_competition_activity) }
    let(:player) { create(:player, school: school) }
    let(:player1) { create(:player1, school: school) }
    
    it 'should set player correctly' do
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

    it 'should filter school correctly' do
      recruit = activity.recruits.build(player: player)
      recruit.save
      activity.reload
      expect(activity.recruits.school_filter(school).last).to eq recruit
    end

    it 'should filter school correctly' do
      recruit = activity.recruits.build(player: player)
      recruit.save
      activity.reload
      expect(activity.recruits.school_filter(school).last).to eq recruit
    end

    it 'should filter school correctly(when the school is not the same)' do
      recruit = activity.recruits.build(player: player)
      recruit.save
      activity.reload
      expect(activity.recruits.school_filter(school1).last).to be_nil
    end

    it 'should get school recruits correctly' do
      recruit = activity.recruits.build(player: player)
      recruit.save
      activity.reload
      expect(activity.school_recruits(school).last).to eq recruit
    end

    it 'should get school recruits correctly(when the school is not the same)' do
      recruit = activity.recruits.build(player: player)
      recruit.save
      activity.reload
      expect(activity.school_recruits(school1).last).to be_nil
    end

    it 'should include player when have recruit the activity' do
      recruit = activity.recruits.build(player: player)
      recruit.save
      activity.reload
      expect(activity.recruit? player).to be true
      expect(activity.recruit? player1).to be false
    end

  end
end
