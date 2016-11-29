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

FactoryGirl.define do
  factory :image do
    file {Rack::Test::UploadedFile.new('./spec/assets/测试图片3.png', 'image/png')}
  end
end
