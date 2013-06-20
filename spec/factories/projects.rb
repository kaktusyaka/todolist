# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do |attr|
    attr.name { Faker::Company.name }
    user
  end
end
