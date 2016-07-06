# == Schema Information
#
# Table name: player_infos
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  card_number :string(255)
#  address     :string(255)
#  code        :string(255)
#  sex         :integer
#  nation      :string(255)
#  player_id   :integer
#  school_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_player_infos_on_player_id  (player_id)
#  index_player_infos_on_school_id  (school_id)
#
# Foreign Keys
#
#  fk_rails_da744551c0  (school_id => schools.id)
#  fk_rails_e40ce0b72c  (player_id => players.id)
#

class PlayerInfo < ActiveRecord::Base
  belongs_to :player
  belongs_to :school

  enum sex: [:male, :female]

  after_create :set_school

  private
    def set_school
      self.player.update_attrubites(school: self.school)
    end
end
