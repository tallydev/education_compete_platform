FactoryGirl.define do
  factory :manager_feedback do
    manager_id 1
    training_course_id 1
    organizer "organizer"
    total_hours "total_hours"
    total_expenses "total_expenses"
    total_expenses_info "total_expenses_info"
    feedback "feedback"
    remark "remark"
  end
end
