require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it { should belong_to(:school) }
  it { should have_many(:training_course_teachers) }
  it { should have_many(:appraises) }
end
