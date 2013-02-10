# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email)    { |n| "person#{n}@example.com" }
    sequence(:username) { |n| "person#{n}" }
    first_name          'Tom' 
    last_name           'Middleton'
    password            'password'
    gender              true

    factory :admin do
      name  'Admin'
      admin true
    end
  end
end
