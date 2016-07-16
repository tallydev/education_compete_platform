require 'rails_helper'

RSpec.describe InfoCompetition::Opus, type: :model do
  it { should belong_to(:recruit) } 

  it { should have_one(:media) } 
  it { should have_one(:ppt) } 
  it { should have_one(:note) } 
end
