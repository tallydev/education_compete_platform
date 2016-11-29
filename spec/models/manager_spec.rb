require 'rails_helper'

RSpec.describe Manager, type: :model do
  it { should belong_to(:school) } 
  it { should have_many(:manager_feedbacks) } 
end