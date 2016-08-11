# == Schema Information
#
# Table name: marks
#
#  id         :integer          not null, primary key
#  score      :float
#  recruit_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_array :text
#
# Indexes
#
#  index_marks_on_recruit_id  (recruit_id)
#

class Mark < ActiveRecord::Base
  serialize :item_array, Array
end
