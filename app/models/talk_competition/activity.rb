# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default(0)
#  type       :string
#  short_name :string
#

class TalkCompetition::Activity < Activity
  has_many :recruits, dependent: :destroy
  has_many :players, through: :recruits
end