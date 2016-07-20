# == Schema Information
#
# Table name: talk_competition_opuses
#
#  id         :integer          not null, primary key
#  content    :string
#  recruit_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_talk_competition_opuses_on_recruit_id  (recruit_id)
#

class TalkCompetition::Opus < ActiveRecord::Base
	 belongs_to :recruit

  has_one :media,  -> { where media_type: "media" }, class_name: "Media", as: :mediaable, dependent: :destroy
  has_one :ppt, -> { where paper_type: "ppt" }, class_name: "Paper", as: :paperable, dependent: :destroy
  has_one :note, -> { where paper_type: "note" }, class_name: "Paper", as: :paperable, dependent: :destroy
  has_one :plan, -> { where paper_type: "plan" }, class_name: "Paper", as: :paperable, dependent: :destroy

  accepts_nested_attributes_for :media, allow_destroy: true
  accepts_nested_attributes_for :ppt, allow_destroy: true
  accepts_nested_attributes_for :note, allow_destroy: true
  accepts_nested_attributes_for :plan, allow_destroy: true
end