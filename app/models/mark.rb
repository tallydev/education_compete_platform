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

class Mark < ActiveRecord::Base
  serialize :item_array, Array

  belongs_to :expert
  belongs_to :recruitable, polymorphic: true

  validates_presence_of :expert
  validates_presence_of :recruitable
  validates_presence_of :item_array

  before_save :cal_score

  private

    def cal_score
      self.score = item_array.reduce(:+)
    end

end
