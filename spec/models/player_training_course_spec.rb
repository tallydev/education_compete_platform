require 'rails_helper'

RSpec.describe PlayerTrainingCourse, type: :model do
  it { should belong_to(:player) }
  it { should belong_to(:training_course) }
  # it { should belong_to(:divide) }
end
