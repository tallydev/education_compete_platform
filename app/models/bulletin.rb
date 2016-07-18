# == Schema Information
#
# Table name: bulletins
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_bulletins_on_activity_id  (activity_id)
#

class Bulletin < ActiveRecord::Base
  belongs_to :activity

  has_one :paper, -> { where paper_type: "paper" }, class_name: "Paper", as: :paperable, dependent: :destroy
  accepts_nested_attributes_for :paper, allow_destroy: true
end
