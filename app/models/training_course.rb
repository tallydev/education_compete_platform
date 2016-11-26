# == Schema Information
#
# Table name: training_courses
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  code                 :string(255)
#  start_time           :datetime
#  end_time             :datetime
#  plan_number          :integer
#  grade_leader         :string(255)
#  training_agency      :string(255)
#  training_address     :string(255)
#  training_fee         :decimal(5, 2)
#  state                :string(255)
#  remark               :text(65535)
#  info                 :string(255)
#  training_backgrounds :string(255)
#  training_target      :string(255)
#  training_content     :text(65535)
#  check_method         :text(65535)
#  project_leader       :string(255)
#  contact              :string(255)
#  school_id            :integer
#  aasm_state           :string(255)
#  category             :string(255)
#  be_applied           :boolean
#  notification_id      :integer
#  start_apply_time     :datetime
#  end_apply_time       :datetime
#  admin_id             :integer
#  linkman              :string(255)
#  phone                :string(255)
#  fax                  :string(255)
#  mobile               :string(255)
#  email                :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_training_courses_on_admin_id   (admin_id)
#  index_training_courses_on_school_id  (school_id)
#
# Foreign Keys
#
#  fk_rails_7072472fd3  (admin_id => admins.id)
#  fk_rails_ab2c462fea  (school_id => schools.id)
#

class TrainingCourse < ActiveRecord::Base
end
