# == Schema Information
#
# Table name: players
#
#  id                     :integer          not null, primary key
#  phone                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  school_id              :integer
#
# Indexes
#
#  index_players_on_phone                 (phone) UNIQUE
#  index_players_on_reset_password_token  (reset_password_token) UNIQUE
#  index_players_on_school_id             (school_id)
#

class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:phone]


  belongs_to :school
  has_one :player_info, dependent: :destroy
  
  #################   InfoCompetition     ########################
  has_many :info_competition_recruits, class_name: "InfoCompetition::Recruit", dependent: :destroy
  has_many :info_competition_activities, class_name: "InfoCompetition::Activity",
      through: :info_competition_recruits, source: :activity

  #################   TalkCompetition     ########################
  has_many :talk_competition_recruits, class_name: "TalkCompetition::Recruit", dependent: :destroy
  has_many :talk_competition_activities, class_name: "TalkCompetition::Activity",
      through: :talk_competition_recruits, source: :activity

  def info
    self.player_info || self.create_player_info
  end

  protected
  def email_required?
    false
  end

  def phone_required?
    true
  end

  def email_changed?
    false
  end
end
