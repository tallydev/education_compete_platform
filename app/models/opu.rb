# == Schema Information
#
# Table name: opus
#
#  id                :integer          not null, primary key
#  type              :string(255)
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Opu < ActiveRecord::Base
end
