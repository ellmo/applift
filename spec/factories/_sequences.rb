FactoryGirl.define do
  sequence(:email) {|n| "user_#{n}@example.com" }
  sequence(:name) {|n| "name_#{n}" }
end