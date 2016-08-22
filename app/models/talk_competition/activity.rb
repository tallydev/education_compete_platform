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

  def route_type
    "talk_competitions"
  end

  def mark_items
    [
      {
        index: 0,
        name: "教学设计",
        max: 25
      },
      {
        index: 1,
        name: "教学实施",
        max: 45
      },
      {
        index: 2,
        name: "教学效果",
        max: 15
      },
      {
        index: 3,
        name: "特色创新",
        max: 15
      }
    ]
  end
end
