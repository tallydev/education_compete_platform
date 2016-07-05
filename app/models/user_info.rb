# == Schema Information
#
# Table name: user_infos
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  id_card_type :integer
#  id_card      :string(255)
#  nation       :string(255)
#  gender       :string(255)
#  tel          :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

class UserInfo < ActiveRecord::Base
  belongs_to :user
end
