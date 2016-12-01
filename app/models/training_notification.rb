# == Schema Information
#
# Table name: training_notifications
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  sub_title  :string(255)
#  view_count :integer          default(0)
#  author     :string(255)
#  content    :text(65535)
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TrainingNotification < ActiveRecord::Base
end
