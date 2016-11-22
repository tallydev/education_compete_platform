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

FactoryGirl.define do
  factory :player_info do
    name "MyString"
    card_number "MyString"
    address "MyString"
    code "MyString"
    sex 1
    nation "MyString"
    player nil
    school nil
  end
end
