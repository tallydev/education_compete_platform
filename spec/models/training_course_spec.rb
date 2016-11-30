require 'rails_helper'

RSpec.describe TrainingCourse, type: :model do
  it { should belong_to(:school) }
  # it { should belong_to(:admin) }
  # it { should belong_to(:notification) }

  it { should have_one(:manager_feedback) }

  # it { should have_many(:tasks) }
  # it { should have_many(:user_training_courses) }
  it { should have_many(:training_course_teachers) }
  it { should have_many(:player_feedbacks) }
  # it { should have_many(:course_resources) }
  it { should have_many(:appraises) }
  # it { should have_many(:journals) }
  # it { should have_many(:divides) }
  it { should have_many(:teachers).through(:training_course_teachers) } 
  # it { should have_many(:users).through(:user_training_courses) } 
end
