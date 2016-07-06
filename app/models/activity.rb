# == Schema Information
#
# Table name: activities
#
<<<<<<< HEAD
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default(0)
#  type       :string(255)
=======
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
>>>>>>> e5f86b40d573938d062cd407ec5cf1f19dc1a786
#

class Activity < ActiveRecord::Base
  has_many :news, dependent: :destroy
  enum status: [:activate, :stop]

  def left_days
    end_time.day - Time.zone.now.day
  end

  def school_recruits school
    recruits.school_filter school
  end
end
