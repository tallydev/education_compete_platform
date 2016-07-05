# == Schema Information
#
# Table name: marks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  score      :float(24)
#  recruit_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_marks_on_recruit_id  (recruit_id)
#

class Mark < ActiveRecord::Base
end
