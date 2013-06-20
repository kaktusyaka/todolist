# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |attr|
    attr.email { Faker::Internet.email }
    attr.password 'testing1'
    attr.password_confirmation 'testing1'
  end
end
