require 'rails_helper'

RSpec.describe Expert, type: :model do
  it { should have_many(:marks) } 
  it { should have_many(:info_competition_recruits).through(:marks) } 
  it { should have_many(:talk_competition_recruits).through(:marks) } 
end
