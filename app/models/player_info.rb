# == Schema Information
#
# Table name: player_infos
#
#  id                 :integer          not null, primary key
#  name               :string
#  card_number        :string
#  address            :string
#  code               :string
#  sex                :integer
#  nation             :string
#  player_id          :integer
#  school_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  birth              :date
#  professional_title :string
#  degree             :string
#  special            :string
#  email              :string
#
# Indexes
#
#  index_player_infos_on_player_id  (player_id)
#  index_player_infos_on_school_id  (school_id)
#

class PlayerInfo < ActiveRecord::Base
  belongs_to :player
  belongs_to :school

  delegate :phone, to: :player

  enum sex: [:male, :female]

  after_save :set_school

  def age
    birth.nil? ? '' : Time.zone.now.year - birth.year
  end

  def sex_name
    self.sex == "male" ? "男" : "女"
  end

  private
    def set_school
      self.player.update(school: self.school) if self.school.present?
    end
end
