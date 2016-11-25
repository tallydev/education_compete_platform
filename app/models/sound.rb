# == Schema Information
#
# Table name: sounds
#
#  id                :integer          not null, primary key
#  type              :string(255)
#  sound_type        :string(255)
#  resourse_id       :integer
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  soundable_id      :integer
#  soundable_type    :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Sound < ActiveRecord::Base
  belongs_to :soundable,  polymorphic: true

   # paperclip gem
  has_attached_file :file
    # :path => ':rails_root/public/system/:id/:attachment/:style/:basename.:extension',
    # :url => '/system/:id/:attachment/:style/:basename.:extension'

  validates_attachment_presence :file

  validates_attachment_size     :file, less_than: 1024.megabytes
  validates_attachment_content_type :file, :content_type => /\Aaudio\/.*\Z/  
  validates_attachment_file_name :file, :matches => [/mp3\Z/]

  def url
    file.try(:url)
  end
end
