# == Schema Information
#
# Table name: bulletins
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_bulletins_on_activity_id  (activity_id)
#

require 'rails_helper'

RSpec.describe Bulletin, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
