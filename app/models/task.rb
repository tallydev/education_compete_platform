# == Schema Information
#
# Table name: tasks
#
#  id                  :integer          not null, primary key
#  mark_id             :integer
#  expert_id           :integer
#  recruit_id          :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  title               :string(255)
#  body                :text(65535)
#  submit_player_count :integer
#  training_course_id  :integer
#  admin_id            :integer
#
# Indexes
#
#  index_tasks_on_admin_id            (admin_id)
#  index_tasks_on_expert_id           (expert_id)
#  index_tasks_on_mark_id             (mark_id)
#  index_tasks_on_recruit_id          (recruit_id)
#  index_tasks_on_training_course_id  (training_course_id)
#

class Task < ActiveRecord::Base
end
