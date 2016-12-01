# == Schema Information
#
# Table name: players
#
#  id                     :integer          not null, primary key
#  phone                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  school_id              :integer
#  authentication_token   :string(30)
#  name                   :string(255)
#  ID_number              :string(255)
#  gender                 :boolean          default(TRUE)
#  birth                  :date
#  school                 :string(255)
#  academy                :string(255)
#  certificate            :string(255)
#  city                   :string(255)
#  nation                 :string(255)
#  position_name          :string(255)
#  position               :string(255)
#  address                :string(255)
#  zip_code               :string(255)
#  telephone              :string(255)
#  email                  :string(255)
#  qq_no                  :string(255)
#  summary                :text(65535)
#  country                :string(255)
#  text                   :text(65535)
#  profssion              :string(255)
#  role                   :integer
#
# Indexes
#
#  index_players_on_authentication_token  (authentication_token) UNIQUE
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

  validates_uniqueness_of :phone, on: :create, message: "用户手机号已注册"

  belongs_to :school
  has_one :player_info, dependent: :destroy
  has_many :player_feedbacks, dependent: :destroy
  
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

  def recruits
    recruits = []
    recruits.concat self.info_competition_recruits
    recruits.concat self.talk_competition_recruits
    recruits
  end

  def activities
    activities = []
    activities.concat self.info_competition_activities
    activities.concat self.talk_competition_activities
    activities
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
