# == Schema Information
#
# Table name: talk_competition_opuses
#
#  id         :integer          not null, primary key
#  content    :string
#  recruit_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_talk_competition_opuses_on_recruit_id  (recruit_id)
#

require 'rails_helper'

RSpec.describe TalkCompetition::Opus, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
