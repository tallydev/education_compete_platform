FactoryGirl.define do
  factory :manager_feedback do
    manager_id 1
    training_course_id 1
    teach "teach"
    discussion "discussion"
    visiting "visiting"
    organization "organization"
    study_life "study_life"
    most_value "most_value"
    most_gain "most_gain"
    graduate_message "graduate_message" 
  end
end
