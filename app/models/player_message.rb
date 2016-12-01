# == Schema Information
#
# Table name: player_messages
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  message_id :integer
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_player_messages_on_message_id  (message_id)
#  index_player_messages_on_player_id   (player_id)
#
# Foreign Keys
#
#  fk_rails_50eca1320e  (player_id => players.id)
#  fk_rails_6943a081c0  (message_id => messages.id)
#

class PlayerMessage < ActiveRecord::Base
  belongs_to :player
  belongs_to :message
end
