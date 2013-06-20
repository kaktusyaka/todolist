# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do |attr|
    attr.name { Faker::Lorem.sentence }
    attr.deadline { Date.today + 3.days }
    project
  end
end
