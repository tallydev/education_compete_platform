module RecruitConcern
  extend ActiveSupport::Concern

  included do
    scope :school_filter, ->(school) { where school: school }
    scope :player_filter, ->(player) { where player: player }
    scope :avg_mark_desc, -> { order(avg_score: :desc) }
    scope :position_asc, -> { order('position IS NULL, position ASC') }

    validates_presence_of :player
    validates_presence_of :activity
    validates_uniqueness_of :player_id, scope: :activity_id

    has_one :opus
    
    belongs_to :player
    belongs_to :school
    belongs_to :activity

    has_many :marks, as: :recruitable, dependent: :destroy
    has_many :experts, through: :marks

    has_many :score_marks, -> { where('score > 0') }, class_name: "Mark", as: :recruitable, dependent: :destroy

    def player_info
      player.try(:player_info)
    end


    def assgin_to_new_activity activity
      return if activity.blank?
      new_recruit = self.dup
      new_recruit.total_score = nil
      new_recruit.avg_score = nil
      new_recruit.score_count = nil
      new_recruit.activity = activity
      new_recruit.save

      self.opus.clone_with_recruit(new_recruit) if self.opus.present?

      new_recruit.reload
    end

  end

end

