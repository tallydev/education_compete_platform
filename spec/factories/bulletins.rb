# == Schema Information
#
# Table name: bulletins
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text(65535)
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_bulletins_on_activity_id  (activity_id)
#

FactoryGirl.define do
  factory :bulletin do
    
  end
end
