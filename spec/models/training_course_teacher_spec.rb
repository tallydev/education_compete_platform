require 'rails_helper'

RSpec.describe TrainingCourseTeacher, type: :model do
  it { should belong_to(:training_course) }
  it { should belong_to(:teacher) }
end
