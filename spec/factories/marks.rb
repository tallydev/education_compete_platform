# == Schema Information
#
# Table name: marks
#
#  id               :integer          not null, primary key
#  score            :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  item_array       :text
#  expert_id        :integer
#  recruitable_id   :integer
#  recruitable_type :string
#
# Indexes
#
#  index_marks_on_expert_id                            (expert_id)
#  index_marks_on_recruitable_type_and_recruitable_id  (recruitable_type,recruitable_id)
#

FactoryGirl.define do
  factory :mark do
    
  end
end
