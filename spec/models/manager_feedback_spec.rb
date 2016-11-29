require 'rails_helper'

RSpec.describe ManagerFeedback, type: :model do
  it { should belong_to(:manager) }
  it { should belong_to(:training_course) }
end
