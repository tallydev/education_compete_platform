# == Schema Information
#
# Table name: player_infos
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  card_number        :string(255)
#  address            :string(255)
#  code               :string(255)
#  sex                :integer
#  nation             :string(255)
#  player_id          :integer
#  school_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  birth              :date
#  professional_title :string(255)
#  degree             :string(255)
#  special            :string(255)
#  email              :string(255)
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

  delegate :phone, to: :player

  enum sex: [:male, :female]

  after_save :set_school

  def age
    Time.zone.now.year - birth.year
  end

  def sex_name
    self.sex == "male" ? "男" : "女"
  end

  private
    def set_school
      self.player.update(school: self.school) if self.school.present?
    end
end
