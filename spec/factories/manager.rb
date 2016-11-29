FactoryGirl.define do
  factory :manager do
    phone "13813813811"   
    password "abcd.1234"
    authentication_token "qwertyuiop123"
  end

  factory :manager1, class: Player do
    phone "13813813812"   
    password "abcd.1234"
    authentication_token "qwertyuiop123"
  end
end
