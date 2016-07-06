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

RSpec.describe TalkCompetition::Activity, type: :model do
  it { should have_many(:recruits) } 
  it { should have_many(:players).through(:recruits) } 
end
