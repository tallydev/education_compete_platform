# == Schema Information
#
# Table name: user_infos
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  id_card_type :integer
#  id_card      :string(255)
#  nation       :string(255)
#  gender       :string(255)
#  tel          :string(255)
#  player_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class UserInfo < ActiveRecord::Base
  belongs_to :player
end
