# == Schema Information
#
# Table name: player_training_courses
#
#  id                 :integer          not null, primary key
#  player_id          :integer
#  training_course_id :integer
#  aasm_state         :string(255)
#  remark             :text(65535)
#  certificate_no     :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_player_training_courses_on_player_id           (player_id)
#  index_player_training_courses_on_training_course_id  (training_course_id)
#

class PlayerTrainingCourse < ActiveRecord::Base
  belongs_to :player
  belongs_to :training_course
  # belongs_to :divide

  # after_create do
  #   message = Message.create!(title: "已报名（待审核）", content: "报名“#{self.training_course.try(:name)}”成功")
  #   UserMessage.create!(user_id: current_user.id, message_id: message.id)
  # end

  #记录报名课程的3种状态 -- 后台
  def training_course_status
     I18n.t :"training_course_state.#{aasm_state}"
  end

  #状态机,报名课程的3种状态
  aasm :column => 'aasm_state' do
  	  state :checking, :initial => true  #默认未通过审核 ,"审核中"
	  state :checked  #"已通过"
	  state :unchecked   #"未通过"  
	    
	  event :unapproved do
		transitions :from => :checking, :to => :unchecked
	  end

	  event :approved do
		transitions :from => :checking, :to => :checked
	  end	 
  end

  #记录报名课程的2种状态 -- 前台
  def player_training_course_status
    now = Time.zone.now
    end_time = self.training_course.end_time
    if now > end_time
      "已结业"
    else
      "未结业"
    end
  end

  scope :enabled, -> {
    where("player_training_courses.deleted_at is null")
  }

  # 统计报名学员的不同职位人数
  def self.role_count
    cache = Player.includes(:player_training_courses).group(:role).count
    # cache.map { |k, v| [User::ROLE[User.find_by_role(k).role.to_sym], v] }.to_h
  end

  #搜索功能
  scope :keyword, -> (keyword) do
    return all if keyword.blank?
    joins(:player).joins(:training_course).where(
      'players.name LIKE ?
       OR players.email LIKE ?
       OR players.address LIKE ?
       OR training_courses.name LIKE ?',
      "%#{keyword}%",
      "%#{keyword}%",
      "%#{keyword}%",
      "%#{keyword}%"
    )
  end

  scope :by_role, -> (role) {
    return all if role.blank?
    eager_load(:player).where("players.role = ?", Player.roles[role])
  }

  # scope :by_divide, -> (divide_id) {
  #   return all if divide_id.blank?
  #   where("player_training_courses.divide_id = ?", divide_id.to_i)
  # }

  # def self.get_player_training_course training_course, status
  #   return all if status.blank?
  #   reached_player_ids = []
  #   unreached_player_ids = []
  #   training_course.player_training_courses.each do |player_training_course|
  #     journals = Journal.where(training_course_id: training_course.id, player_id: player_training_course.player.id).length
  #     if journals >= training_course.journal_number.to_i
  #       reached_player_ids << player_training_course.player.id
  #     else
  #       unreached_player_ids << player_training_course.player.id
  #     end
  #   end
  #   if status == "reached"
  #     PlayerTrainingCourse.where({player_id: reached_player_ids})
  #   else
  #     PlayerTrainingCourse.where({player_id: unreached_player_ids})
  #   end
  # end
end
