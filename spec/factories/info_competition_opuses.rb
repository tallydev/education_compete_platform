# == Schema Information
#
# Table name: info_competition_opuses
#
#  id         :integer          not null, primary key
#  recruit_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content    :string(255)
#
# Indexes
#
#  index_info_competition_opuses_on_recruit_id  (recruit_id)
#

FactoryGirl.define do
  factory :info_competition_opus, class: 'InfoCompetition::Opus' do
    recruit nil
  end
end
