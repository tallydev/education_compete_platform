# == Schema Information
#
# Table name: resourses
#
#  id            :integer          not null, primary key
#  type          :string(255)
#  resourse_type :string(255)
#  catalog       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Resourse, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
