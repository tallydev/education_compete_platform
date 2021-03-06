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
#  school_id              :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  type                   :string
#
# Indexes
#
#  index_users_on_phone                 (phone) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_school_id             (school_id)
#

FactoryGirl.define do
  factory :user do
    phone "123456"   
    password "abcd.1234"
  end
end
