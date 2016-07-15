# == Schema Information
#
# Table name: recruits
#
#  id          :integer          not null, primary key
#  activity_id :integer
#  opu_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_recruits_on_activity_id  (activity_id)
#  index_recruits_on_opu_id       (opu_id)
#

class Recruit < ActiveRecord::Base
  belongs_to :activity

  has_one :paper, -> { where paper_type: "paper" }, class_name: "Paper", as: :paperable, dependent: :destroy
  accepts_nested_attributes_for :paper, allow_destroy: true
end
