# == Schema Information
#
# Table name: managers
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
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
#  type                   :string(255)
#  tag                    :string(255)
#  authentication_token   :string(30)
#
# Indexes
#
#  index_managers_on_authentication_token  (authentication_token) UNIQUE
#  index_managers_on_email                 (email) UNIQUE
#  index_managers_on_reset_password_token  (reset_password_token) UNIQUE
#  index_managers_on_school_id             (school_id)
#
# Foreign Keys
#
#  fk_rails_e9f7284201  (school_id => schools.id)
#

class Manager < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:email]

  validates_uniqueness_of :email, on: :create, message: "email已注册"

  belongs_to :school
  has_many :manager_feedbacks, dependent: :destroy
end
