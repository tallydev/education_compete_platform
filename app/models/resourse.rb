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

class Resourse < ActiveRecord::Base
  
  ######## catalog_content ################
  has_many :videoes, -> { where media_type: "video" }, class_name: "Media", as: :mediaable, dependent: :destroy
  accepts_nested_attributes_for :videoes, allow_destroy: true

  has_many :images, -> { where photo_type: "picture" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  has_many :documents, -> { where paper_type: "document" }, class_name: "Paper", as: :paperable, dependent: :destroy
  accepts_nested_attributes_for :documents, allow_destroy: true

  has_many :forms, -> { where paper_type: "form" }, class_name: "Paper", as: :paperable, dependent: :destroy
  accepts_nested_attributes_for :forms, allow_destroy: true

  has_many :coursewares, -> { where paper_type: "courseware" }, class_name: "Paper", as: :paperable, dependent: :destroy
  accepts_nested_attributes_for :coursewares, allow_destroy: true

  has_many :audioes, -> { where sound_type: "audioe" }, class_name: "Sound", as: :soundable, dependent: :destroy
  accepts_nested_attributes_for :audioes, allow_destroy: true
  
  ########## order_DESC ####################
  scope :order_desc, -> {order("updated_at DESC")}
 
  ########### enum #########################
  enum catalog: {
    video: 1,
    document: 2,
    form: 3,
    courseware: 4,
    photo: 5,
    audio: 6
  }

  ListCatalog = {
    video: "视频",
    document: "文档",
    form: "表格",
    courseware: "课件",
    photo: "图片",
    audio: "音频"
  }
  
  ############ query_catalog ###############
  scope :is_video, -> {where(catalog: 1)}
  scope :is_document, -> {where(catalog: 2)}
  scope :is_form, -> {where(catalog: 3)}
  scope :is_courseware, -> {where(catalog: 4)}
  scope :is_photo, -> {where(catalog: 5)}
  scope :is_audio, -> {where(catalog: 6)}
end
