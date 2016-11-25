# == Schema Information
#
# Table name: resource_libraries
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  catalog    :integer
#  mdate      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ResourceLibrary, type: :model do
	it { should have_one(:video) }
	it { should have_one(:picture) }
	it { should have_one(:document) }
	it { should have_one(:form) }
	it { should have_one(:courseware) }
	it { should have_one(:audio) }
end
