# == Schema Information
#
# Table name: resource_libraries
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  catalog    :integer
#  mdate      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ResourceLibrary < ActiveRecord::Base
end
