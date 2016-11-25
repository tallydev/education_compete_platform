# == Schema Information
#
# Table name: media
#
#  id                :integer          not null, primary key
#  type              :string
#  media_type        :string
#  mediaable_id      :integer
#  mediaable_type    :string
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_media_on_mediaable_type_and_mediaable_id  (mediaable_type,mediaable_id)
#

require 'rails_helper'

RSpec.describe Media, type: :model do
  it { should belong_to(:mediaable) } 
  # it { should have_one(:file) } 
end