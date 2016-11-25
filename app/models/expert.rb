# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  phone                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  email                  :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  school_id              :integer
#  type                   :string(255)
#  tag                    :string(255)
#  authentication_token   :string(30)
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_phone                 (phone) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_school_id             (school_id)
#

class Expert < User

	attr_accessor :name

	validates :phone, :email, :password, presence: true

	has_many :marks, dependent: :destroy

  ##################   InfoCompetition     ########################
  has_many :info_competition_recruits, through: :marks, source: :recruitable, source_type: "InfoCompetition::Recruit", dependent: :destroy

  ##################   TalkCompetition     ########################
  has_many :talk_competition_recruits, through: :marks, source: :recruitable, source_type: "TalkCompetition::Recruit", dependent: :destroy

	def name
		self.try(:user_info).try(:name)
	end
end
