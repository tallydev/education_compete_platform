# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  type              :string
#  photo_type        :string
#  imageable_id      :integer
#  imageable_type    :string
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_images_on_imageable_type_and_imageable_id  (imageable_type,imageable_id)
#

FactoryGirl.define do
  factory :image do
    
  end
end
