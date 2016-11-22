# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default(0)
#  type       :string(255)
#  short_name :string(255)
#  offline    :boolean
#

class TalkCompetition::Activity < Activity
  has_many :recruits, dependent: :destroy
  has_many :players, through: :recruits

  def self.model_name
    Activity.model_name
  end

  def route_type
    "talk_competitions"
  end

  def mark_items
    [
      {
        index: 0,
        name: "课程整体设计",
        max: 40
      },
      {
        index: 1,
        name: "教学实施",
        max: 45
      },
      {
        index: 2,
        name: "现场表现",
        max: 10
      },
      {
        index: 3,
        name: "现场答辩",
        max: 5
      }
    ]
  end
end
