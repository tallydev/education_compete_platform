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

class SchoolUser < User
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:phone]
  
  belongs_to :school

  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   sign_in = conditions.delete(:sign_in)
  #   #where(conditions).where(["phone = :value OR name = :value", { :value => login.strip }]).first
  #   where(conditions).where(["phone = :value or email = :value", { :value => sign_in.strip }]).first
  # end
end
