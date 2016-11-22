# == Schema Information
#
# Table name: talk_competition_opuses
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  recruit_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_talk_competition_opuses_on_recruit_id  (recruit_id)
#

FactoryGirl.define do
  factory :talk_competition_opus, class: 'TalkCompetition::Opus' do
    content "MyString"
    TalkCompetition ""
  end
end
