# == Schema Information
#
# Table name: papers
#
#  id                :integer          not null, primary key
#  type              :string(255)
#  paper_type        :string(255)
#  paperable_id      :integer
#  paperable_type    :string(255)
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_papers_on_paperable_type_and_paperable_id  (paperable_type,paperable_id)
#

require 'rails_helper'

RSpec.describe Paper, type: :model do
  it { should belong_to(:paperable) } 
end
