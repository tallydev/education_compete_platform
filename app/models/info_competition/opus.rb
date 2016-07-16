# == Schema Information
#
# Table name: info_competition_opuses
#
#  id         :integer          not null, primary key
#  recruit_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_info_competition_opuses_on_recruit_id  (recruit_id)
#

class InfoCompetition::Opus < ActiveRecord::Base
  belongs_to :recruit

  has_one :media,  -> { where media_type: "media" }, class_name: "Media", as: :mediaable, dependent: :destroy
  has_one :ppt, -> { where paper_type: "ppt" }, class_name: "Paper", as: :paperable, dependent: :destroy
  has_one :note, -> { where paper_type: "note" }, class_name: "Paper", as: :paperable, dependent: :destroy
  has_one :plan, -> { where paper_type: "plan" }, class_name: "Paper", as: :paperable, dependent: :destroy
  
end
