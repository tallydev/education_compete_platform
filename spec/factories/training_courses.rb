# == Schema Information
#
# Table name: training_courses
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  code                :string(255)
#  start_time          :datetime
#  end_time            :datetime
#  plan_number         :integer
#  training_address    :string(255)
#  training_fee        :decimal(10, 2)
#  state               :string(255)
#  remark              :text(65535)
#  info                :text(65535)
#  training_background :text(65535)
#  training_target     :text(65535)
#  training_content    :text(65535)
#  check_method        :text(65535)
#  project_leader      :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  contact             :string(255)
#  school_id           :integer
#  aasm_state          :string(255)
#  category            :string(255)
#  grade_leader        :string(255)
#  be_applied          :boolean          default(FALSE)
#  notification_id     :integer
#  start_apply_time    :datetime
#  end_apply_time      :datetime
#  admin_id            :integer
#  linkman             :string(255)
#  phone               :string(255)
#  fax                 :string(255)
#  mobile              :string(255)
#  email               :string(255)
#

FactoryGirl.define do
  factory :training_course do
    name "name"
    code "code"
    start_time "#{Time.zone.now + 3.day}"
    end_time "#{Time.zone.now + 120.day}"
    plan_number "1010101010"       
    training_address "training_address"
    training_fee "1000.50"   
    state "state"           
    remark "remark"            
    info "info"              
    training_background "training_background"
    training_target "training_target"    
    training_content "training_content"  
    check_method "check_method"      
    project_leader "project_leader"              
    contact "contact"           
    school_id  1         
    aasm_state "aasm_state"  
    category  "category"          
    grade_leader "grade_leader"      
    be_applied  "FALSE"               
    notification_id  1   
    start_apply_time  "#{Time.zone.now + 3.day}"  
    end_apply_time  "#{Time.zone.now + 9.day}"    
    admin_id   1         
    linkman "linkman"           
    phone "13813813811"              
    fax "fax"                
    mobile "mobile"             
    email "example@example.com"
  end
end
