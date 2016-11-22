# == Schema Information
#
# Table name: player_infos
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  card_number        :string(255)
#  address            :string(255)
#  code               :string(255)
#  sex                :integer
#  nation             :string(255)
#  player_id          :integer
#  school_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  birth              :date
#  professional_title :string(255)
#  degree             :string(255)
#  special            :string(255)
#  email              :string(255)
#
# Indexes
#
#  index_player_infos_on_player_id  (player_id)
#  index_player_infos_on_school_id  (school_id)
#

require 'rails_helper'

RSpec.describe PlayerInfo, type: :model do
  it { should belong_to(:player) } 
  it { should belong_to(:school) } 
end
