# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Trupe"
    email "trupe@ugmail.com"
  end

  trait :marcio do
    name "Márcio"
    email "marcio@ugmail.com"
  end
end
