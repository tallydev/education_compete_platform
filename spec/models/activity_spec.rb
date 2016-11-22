# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default(0)
#  type       :string(255)
#  short_name :string(255)
#  offline    :boolean
#

require 'rails_helper'

RSpec.describe Activity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
