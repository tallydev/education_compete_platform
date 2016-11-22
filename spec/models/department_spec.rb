# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  school_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_departments_on_school_id  (school_id)
#

require 'rails_helper'

RSpec.describe Department, type: :model do
  it { should belong_to(:school) } 
end
