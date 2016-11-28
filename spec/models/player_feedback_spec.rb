# == Schema Information
#
# Table name: player_feedbacks
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  training_course_id :integer
#  teach              :string(255)
#  discussion         :string(255)
#  visiting           :string(255)
#  organization       :string(255)
#  study_life         :string(255)
#  most_value         :text(65535)
#  most_gain          :text(65535)
#  graduate_message   :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_player_feedbacks_on_training_course_id  (training_course_id)
#  index_player_feedbacks_on_user_id             (user_id)
#

require 'rails_helper'

RSpec.describe PlayerFeedback, type: :model do
  it { should belong_to(:player) }
  it { should belong_to(:training_course) }
end
