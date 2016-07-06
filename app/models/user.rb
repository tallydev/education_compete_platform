# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  phone                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  email                  :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  school_id              :integer
#  type                   :string
#
# Indexes
#
#  index_users_on_phone                 (phone) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_school_id             (school_id)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:sign_in]

  attr_accessor :sign_in
  
  has_one :user_info
  belongs_to :school

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    p "==================#{conditions}===================="
    sign_in = conditions.delete(:sign_in)
    #where(conditions).where(["phone = :value OR name = :value", { :value => login.strip }]).first
       where(conditions).where(["phone = :value or email = :value", { :value => sign_in.strip }]).first
  end

  protected
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
