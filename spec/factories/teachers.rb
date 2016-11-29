# == Schema Information
#
# Table name: teachers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  id_card    :string(255)
#  position   :string(255)
#  sex        :boolean          default(TRUE)
#  remark     :text(65535)
#  address    :string(255)
#  mobile     :string(255)
#  phone      :string(255)
#  qq         :string(255)
#  email      :string(255)
#  postcode   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  school_id  :integer
#  job_title  :string(255)
#

FactoryGirl.define do
  factory :teacher do
    school_id 1
    name "计算机老师"
    id_card "id_card"
    position "position"
    sex true 
    remark "remark"
    address "上海XXXXXXX"
    mobile "mobile"
    phone "13813813811"
    qq "520520520"
    email "502502502@163.com"
    postcode "520520"
    job_title "计算机老师"
  end
end
