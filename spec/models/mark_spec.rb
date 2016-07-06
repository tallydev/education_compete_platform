# == Schema Information
#
# Table name: marks
#
#  id         :integer          not null, primary key
#  score      :float
#  recruit_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_marks_on_recruit_id  (recruit_id)
#

require 'rails_helper'

RSpec.describe Mark, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
