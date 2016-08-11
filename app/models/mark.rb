# == Schema Information
#
# Table name: marks
#
#  id         :integer          not null, primary key
#  score      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_array :text
#  expert_id  :integer
#
# Indexes
#
#  index_marks_on_expert_id  (expert_id)
#

class Mark < ActiveRecord::Base
  serialize :item_array, Array

  belongs_to :expert
  belongs_to :recruit

  validates_presence_of :expert
  validates_presence_of :recruit
  validates_presence_of :item_array

  before_save :cal_score

  private

    def cal_score
      score = item_array.reduce(:+)
    end

end
