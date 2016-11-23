require 'rails_helper'

RSpec.describe ResourceLibrary, type: :model do
	it { should have_one(:video) }
	it { should have_one(:picture) }
	it { should have_one(:document) }
	it { should have_one(:form) }
	it { should have_one(:courseware) }
	it { should have_one(:audio) }
end
