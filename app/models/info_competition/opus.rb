# == Schema Information
#
# Table name: info_competition_opuses
#
#  id         :integer          not null, primary key
#  recruit_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_info_competition_opuses_on_recruit_id  (recruit_id)
#

class InfoCompetition::Opus < ActiveRecord::Base
  belongs_to :recruit
end
