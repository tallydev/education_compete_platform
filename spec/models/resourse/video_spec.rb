require 'rails_helper'

RSpec.describe Resourse::Video, type: :model do
  it { should have_one(:video) } 
end
