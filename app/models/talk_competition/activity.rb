# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  start_time  :datetime
#  end_time    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer          default(0)
#  type        :string
#  bulletin_id :integer
#  short_name  :string
#
# Indexes
#
#  index_activities_on_bulletin_id  (bulletin_id)
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
        max: 20
      },
      {
        index: 1,
        name: "创新与应用",
        max: 30
      },
      {
        index: 2,
        name: "效果性",
        max: 20
      },
      {
        index: 3,
        name: "技术性",
        max: 30
      }
    ]
  end
end
