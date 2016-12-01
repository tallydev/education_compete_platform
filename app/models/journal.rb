# == Schema Information
#
# Table name: journals
#
#  id                 :integer          not null, primary key
#  player_id          :integer
#  training_course_id :integer
#  title              :string(255)
#  content            :text(65535)
#  add_date           :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_journals_on_player_id           (player_id)
#  index_journals_on_training_course_id  (training_course_id)
#
# Foreign Keys
#
#  fk_rails_0ec20b3da6  (training_course_id => training_courses.id)
#  fk_rails_628628b1fd  (player_id => players.id)
#

class Journal < ActiveRecord::Base
  belongs_to :player
  belongs_to :training_course
end
