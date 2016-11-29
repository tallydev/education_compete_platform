require 'rails_helper'

RSpec.describe Appraise, type: :model do
  it { should belong_to(:player) } 
  it { should belong_to(:teacher) }
  it { should belong_to(:training_course) }
end