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

FactoryGirl.define do
  factory :sound do
    type ""
    sound_type "MyString"
    file ""
    soundable nil
  end
end
