# == Schema Information
#
# Table name: resourse_videos
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  video_type :string(255)
#  catalog    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resourse::Video < ActiveRecord::Base
  has_one :video, -> { where media_type: "video" }, class_name: "Media", as: :mediaable, dependent: :destroy
  accepts_nested_attributes_for :video, allow_destroy: true

  ########## order_DESC ####################
  scope :order_desc, -> {order("updated_at DESC")}
end
