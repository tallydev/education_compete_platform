# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  mark_id    :integer
#  expert_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tasks_on_expert_id  (expert_id)
#  index_tasks_on_mark_id    (mark_id)
#

class Task < ActiveRecord::Base
end
