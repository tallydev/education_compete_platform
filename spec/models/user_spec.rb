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
#
# Indexes
#
#  index_users_on_phone                 (phone) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_school_id             (school_id)
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:school) } 

  describe 'user model test' do
    let(:school) { create(:school) }
    let(:user) { create(:user, school: school) }
    
    it 'should be not empty' do
      expect(user).not_to be_nil
    end

    it 'should relate school correct' do
      expect(user.school).to eq(school)
    end
  end
end
