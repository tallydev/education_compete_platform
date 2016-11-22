# == Schema Information
#
# Table name: marks
#
#  id               :integer          not null, primary key
#  score            :float(24)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  item_array       :text(65535)
#  expert_id        :integer
#  recruitable_id   :integer
#  recruitable_type :string(255)
#
# Indexes
#
#  index_marks_on_expert_id                            (expert_id)
#  index_marks_on_recruitable_type_and_recruitable_id  (recruitable_type,recruitable_id)
#

class Mark < ActiveRecord::Base
  serialize :item_array, Array

  belongs_to :expert
  belongs_to :recruitable, polymorphic: true

  validates_presence_of :expert
  validates_presence_of :recruitable
  validates_presence_of :item_array, on: :update

  before_save :cal_score
  after_save  :cal_mark


  # 作品(数组)分配专家
  def self.distribute_expert activity_recruits, selected_expert_ids
    selected_expert_ids = selected_expert_ids.map { |id| id.to_i }
    Mark.transaction do
      activity_recruits.each do |recruit|
        # 过去分配的专家列表
        old_expert_ids = recruit.marks.pluck(:expert_id)
        # 此次该删除的专家
        delete_expert_ids = old_expert_ids - selected_expert_ids
        recruit.marks.where(expert_id: delete_expert_ids).destroy_all
        # 此次该新增的专家
        new_expert_ids = selected_expert_ids - old_expert_ids
        new_expert_ids.each do |id|
          recruit.marks.create(expert_id: id.to_i)
        end
      end
    end
  end


  private

    def cal_score
      self.score = item_array.reduce(:+)
    end

    def cal_mark
      activity = self.recruitable.try(:activity)
      project = activity.try(:project)
      return if activity.blank?

      if project.present?
        recruits = activity.project_recruits project
      else
        recruits = activity.recruits
      end

      recruits.each do |recruit|
        score_count = recruit.score_marks.count
        
        if score_count > 0
          total_score = recruit.score_marks.pluck(:score).map {|score| score.to_i}.sum
          avg_score = (total_score.to_f / score_count).to_f.round(2)
          recruit.update(total_score: total_score, score_count: score_count, avg_score: avg_score)
        end
      end
    end

end
