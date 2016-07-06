# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  mark_id    :integer
#  expert_id  :integer
#  recruit_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tasks_on_expert_id   (expert_id)
#  index_tasks_on_mark_id     (mark_id)
#  index_tasks_on_recruit_id  (recruit_id)
#

require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
