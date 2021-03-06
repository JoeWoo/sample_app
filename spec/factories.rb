FactoryGirl.define do
  factory :user do
    name "wujian"
    email "wujian@qq.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
=begin
FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end
end

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password confirmation "foobar"
    factory :admin do
      admin true
    end
  end
=end
