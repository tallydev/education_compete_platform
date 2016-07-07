# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  start_time  :datetime
#  end_time    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer          default(0)
#  type        :string
#  bulletin_id :integer
#  short_name  :string
#
# Indexes
#
#  index_activities_on_bulletin_id  (bulletin_id)
#

FactoryGirl.define do
  factory :activity do
    
  end
end
