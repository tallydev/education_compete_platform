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

require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should belong_to(:school) } 
  it { should have_one(:player_info) } 
  it { should have_many(:info_competition_recruits) } 
  it { should have_many(:info_competition_activities).through(:info_competition_recruits) } 
  it { should have_many(:talk_competition_recruits) } 
  it { should have_many(:talk_competition_activities).through(:talk_competition_recruits) } 
end
