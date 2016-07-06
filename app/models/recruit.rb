# == Schema Information
#
# Table name: recruits
#
#  id            :integer          not null, primary key
#  activities_id :integer
#  players_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Recruit < ActiveRecord::Base
end
