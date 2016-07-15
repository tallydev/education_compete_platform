# == Schema Information
#
# Table name: media
#
#  id                :integer          not null, primary key
#  type              :string(255)
#  media_type        :string(255)
#  mediaable_id      :integer
#  mediaable_type    :string(255)
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_media_on_mediaable_type_and_mediaable_id  (mediaable_type,mediaable_id)
#

class Medium < ActiveRecord::Base
  belongs_to :mediumable, polymorphic: true
end
