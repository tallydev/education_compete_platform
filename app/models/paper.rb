# == Schema Information
#
# Table name: papers
#
#  id                :integer          not null, primary key
#  type              :string
#  paper_type        :string
#  paperable_id      :integer
#  paperable_type    :string
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_papers_on_paperable_type_and_paperable_id  (paperable_type,paperable_id)
#

class Paper < ActiveRecord::Base
  belongs_to :paperable, polymorphic: true

  has_attached_file :file
    # :path => ':rails_root/public/system/:id/:attachment/:style/:basename.:extension',
    # :url => '/system/:id/:attachment/:style/:basename.:extension'

  validates_attachment_presence :file
  validates_attachment_size     :file, less_than: 50.megabytes
  validates_attachment_content_type :file, content_type: ["application/msword", 
              "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
              "application/.openxmlformats..document","application/vnd.ms-powerpoint",
              "application/pdf"]

  after_commit :translate_file, :on => :create

  def url
    file.try(:url)
  end

  def translate_file
    unless self.file_content_type.eql?('application/pdf')
      p file.path
      opts = {}
      Docsplit.extract_pdf(self.file.path, opts)
    end
  end

end
