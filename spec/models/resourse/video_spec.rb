# == Schema Information
#
# Table name: resourse_videos
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  video_type :string(255)
#  catalog    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Resourse::Video, type: :model do
  # it { should have_one(:file) } 
end
