module RecruitConcern
  extend ActiveSupport::Concern

  included do
    scope :school_filter, ->(school) { where school: school }
    scope :player_filter, ->(player) { where player: player }

    validates_presence_of :player
    validates_presence_of :activity
    validates_uniqueness_of :player_id, scope: :activity_id
  end
end

