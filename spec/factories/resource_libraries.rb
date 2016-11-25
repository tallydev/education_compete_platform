# == Schema Information
#
# Table name: resource_libraries
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  catalog    :integer
#  mdate      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :resource_library do
    title "resource_library_title"
    catalog "picture"
    mdate "resource_library_mdate"
  end
end
