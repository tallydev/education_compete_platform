# == Schema Information
#
# Table name: resourses
#
#  id            :integer          not null, primary key
#  type          :string(255)
#  resourse_type :string(255)
#  catalog       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :resourse do
    type ""
    resourse_type "MyString"
    catalog 1
  end
end
