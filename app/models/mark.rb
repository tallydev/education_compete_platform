# == Schema Information
#
# Table name: marks
#
#  id               :integer          not null, primary key
#  score            :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  item_array       :text
#  expert_id        :integer
#  recruitable_id   :integer
#  recruitable_type :string
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
  before_update :cal_score


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

  # 返回总分降序的报名列表
  def Mark.rank_recruits activity
    recruits = activity.recruits
    Mark.transaction do
      recruits.each do |recruit|
        total_score = recruit.marks.pluck(:score).map {|score| score.to_i}.sum
        recruit.update(total_score: total_score)
      end    
    end 
    recruits.order(total_score: :desc)
  end

  private

    def cal_score
      self.score = item_array.reduce(:+)
    end

end
