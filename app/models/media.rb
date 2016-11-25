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

class Media < ActiveRecord::Base
  belongs_to :mediaable, polymorphic: true


  has_attached_file :file
    # :path => ':rails_root/public/system/:id/:attachment/:style/:basename.:extension',
    # :url => '/system/:id/:attachment/:style/:basename.:extension'

  validates_attachment_presence :file

  validates_attachment_size     :file, less_than: 1024.megabytes
  validates_attachment_content_type :file, :content_type => /\Avideo\/.*\Z/  
  # validates_attachment_file_name :file, :matches => [/mp4\Z/]

  def url
    file.try(:url)
  end
end
