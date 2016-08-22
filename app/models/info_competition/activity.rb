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

class InfoCompetition::Activity < Activity
  has_many :recruits, dependent: :destroy
  has_many :players, through: :recruits

  PROJECTS = [
    "信息化教学设计比赛", "信息化课堂教学比赛", "信息化实训教学比赛"
  ]

  def sorted_recurits
    raw_recruits = self.recruits
    sorted = {}
    raw_recruits.each do |recruit|
      sorted[recruit.project] ||= []
      sorted[recruit.project] << recruit
    end
    sorted
  end

  def route_type
    "info_competitions"
  end

  def mark_items(params={})
    _project = params[:project] || PROJECTS[0]
    case _project
    when PROJECTS[0]
      [
        {
          index: 0,
          name: "总体设计",
          max: 40
        },
        {
          index: 1,
          name: "教学过程",
          max: 30
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
    when PROJECTS[1]
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
    when PROJECTS[2]
      [
        {
          index: 0,
          name: "总体设计",
          max: 30
        },
        {
          index: 1,
          name: "教学过程",
          max: 30
        },
        {
          index: 2,
          name: "现场操作",
          max: 25
        },
        {
          index: 3,
          name: "特色创新",
          max: 15
        }
      ]
    end
  end
end
