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

class Activity < ActiveRecord::Base
  has_many :news, dependent: :destroy
  
  enum status: [:activate, :stop]

  def left_days
    days = (end_time.to_date - Time.zone.now.to_date).to_i
    days < 0 ? 0 : days
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

  def opus? player
    recruits.player_filter(player).try(:first).try(:opus).present?
  end

  def player_opus player
    recruits.player_filter(player).try(:first).try(:opus)
  end
end
