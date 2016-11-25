# == Schema Information
#
# Table name: events
#
#  id                       :integer          not null, primary key
#  title                    :string(255)
#  content                  :text(65535)
#  classify                 :integer          default(1)
#  picture_url              :string(255)
#  is_competition           :boolean
#  picture_url_file_name    :string(255)
#  picture_url_content_type :string(255)
#  picture_url_file_size    :integer
#  picture_url_updated_at   :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Event < ActiveRecord::Base
end
