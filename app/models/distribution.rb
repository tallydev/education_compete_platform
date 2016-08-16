# == Schema Information
#
# Table name: distributions
#
#  id               :integer          not null, primary key
#  recruitable_id   :integer
#  recruitable_type :string
#  expert_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Distribution < ActiveRecord::Base
	belongs_to :expert
	belongs_to :recruitable, polymorphic: true

	# 分配专家相关
	validates_presence_of :expert
  validates_presence_of :recruitable
end
