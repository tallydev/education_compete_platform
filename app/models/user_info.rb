# == Schema Information
#
# Table name: user_infos
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  id_card_type :integer
#  id_card      :string
#  nation       :string
#  gender       :string
#  tel          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

class UserInfo < ActiveRecord::Base
  belongs_to :user
end
