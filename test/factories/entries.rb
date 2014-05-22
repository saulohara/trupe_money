# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
		association :user, factory: :user
    amount 50
    entry_type "m"
    month Date.today.month
    year Date.today.year
  end

end
