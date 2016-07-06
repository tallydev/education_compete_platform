module RecruitConcern
  extend ActiveSupport::Concern

  included do
    before_save :set_school
    scope :school_filter, ->(school) { where school: school }
  end

  def set_school
    self.school = player.try(:school)
  end
end

