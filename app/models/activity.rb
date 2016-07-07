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

class Activity < ActiveRecord::Base
  has_many :news, dependent: :destroy
  enum status: [:activate, :stop]

  def left_days
    end_time.day - Time.zone.now.day
  end

  # 学校本次比赛的报名列表
  def school_recruits school
    recruits.school_filter school
  end

  # 用户是否报名过这个比赛
  def recruit? player
    players.try(:include?, player)
  end

  # 用户本次比赛的报名信息
  def player_recruit player
    recruits.player_filter(player).try(:first)
  end
end
