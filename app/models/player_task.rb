# == Schema Information
#
# Table name: player_tasks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text(65535)
#  appraise   :string(255)
#  task_id    :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_player_tasks_on_player_id  (player_id)
#  index_player_tasks_on_task_id    (task_id)
#
# Foreign Keys
#
#  fk_rails_08a01fba0a  (task_id => tasks.id)
#  fk_rails_4cb07ab471  (player_id => players.id)
#

class PlayerTask < ActiveRecord::Base
  belongs_to :task
  belongs_to :player
end
