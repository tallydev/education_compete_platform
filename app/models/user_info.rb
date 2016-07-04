# == Schema Information
#
# Table name: user_infos
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  id_card_type :integer
#  id_card      :string
#  nation       :string
#  gender       :string
#  tel          :string
#  player_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_user_infos_on_player_id  (player_id)
#

class UserInfo < ActiveRecord::Base
  belongs_to :player
end
