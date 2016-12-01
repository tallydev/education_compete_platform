require 'rails_helper'

RSpec.describe TrainingNotification, type: :model do
  it { should have_one(:training_course) } 
end
