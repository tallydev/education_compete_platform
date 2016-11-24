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
  ######## catalog_content ################
  has_one :video, -> { where media_type: "video" }, class_name: "Media", as: :mediaable, dependent: :destroy
  accepts_nested_attributes_for :video, allow_destroy: true

  has_one :picture, -> { where photo_type: "picture" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :picture, allow_destroy: true

  has_one :document, -> { where paper_type: "document" }, class_name: "Paper", as: :paperable, dependent: :destroy
  accepts_nested_attributes_for :document, allow_destroy: true

  has_one :form, -> { where paper_type: "form" }, class_name: "Paper", as: :paperable, dependent: :destroy
  accepts_nested_attributes_for :form, allow_destroy: true

  has_one :courseware, -> { where paper_type: "courseware" }, class_name: "Paper", as: :paperable, dependent: :destroy
  accepts_nested_attributes_for :courseware, allow_destroy: true

  has_one :audio, -> { where sound_type: "audio" }, class_name: "Sound", as: :soundable, dependent: :destroy
  accepts_nested_attributes_for :audio, allow_destroy: true
  
  ########## order_DESC ####################
  scope :order_desc, -> {order("updated_at DESC")}
 
  ########### enum #########################
  enum catalog: {
    video: 1,
    document: 2,
    form: 3,
    courseware: 4,
    picture: 5,
    audio: 6
  }

  ListCatalog = {
    video: "视频",
    document: "文档",
    form: "表格",
    courseware: "课件",
    picture: "图片",
    audio: "音频"
  }
  
  ############ query_catalog ###############
  scope :is_catalog, ->(num) {where(catalog: num)}
  # scope :is_document, -> {where(catalog: 2)}
  # scope :is_form, -> {where(catalog: 3)}
  # scope :is_courseware, -> {where(catalog: 4)}
  # scope :is_photo, -> {where(catalog: 5)}
  # scope :is_audio, -> {where(catalog: 6)}

  def resource_library_catalog
    I18n.t :"resource_library_catalog.#{catalog}"
  end

  ############### Download ################
  def send_file(file)
            send_file File.dirname(__FILE__), self.file,
            type: self.file.content_type,
            x_sendfile: true
  end
  ################ error #################
  def error_info(message)
    @error = message
    respond_with(@error)
  end
end
