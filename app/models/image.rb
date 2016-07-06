# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  type              :string(255)
#  photo_type        :string(255)
#  imageable_id      :integer
#  imageable_type    :string(255)
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_images_on_imageable_type_and_imageable_id  (imageable_type,imageable_id)
#

class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :file, styles: { mini: '48x48>', small: '150x150>', medium: '300x300>', product: '600x600>', large: '1280x1280>' }

  validates_attachment_presence :file
  validates_attachment_size     :file, less_than: 5.megabytes
  validates_attachment_content_type :file, content_type: /image\/.*\Z/

  def url mode
    file.present? ? file.url(mode) : ""
  end
  
end
