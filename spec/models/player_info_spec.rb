require 'rails_helper'

RSpec.describe PlayerInfo, type: :model do
  it { should belong_to(:player) } 
  it { should belong_to(:school) } 
end
