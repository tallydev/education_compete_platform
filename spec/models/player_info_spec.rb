# == Schema Information
#
# Table name: player_infos
#
#  id                 :integer          not null, primary key
#  name               :string
#  card_number        :string
#  address            :string
#  code               :string
#  sex                :integer
#  nation             :string
#  player_id          :integer
#  school_id          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  birth              :date
#  professional_title :string
#  degree             :string
#  special            :string
#  email              :string
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
