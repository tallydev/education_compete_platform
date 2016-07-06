# == Schema Information
#
# Table name: activities
#
<<<<<<< b74be27666bb2f1fe644943133b4d75e208bfe8e
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
#
# Indexes
#
#  index_activities_on_bulletin_id  (bulletin_id)
>>>>>>> add activities seed
#

class InfoCompetition::Activity < Activity
  has_many :recruits, dependent: :destroy
  has_many :players, through: :recruits
end
