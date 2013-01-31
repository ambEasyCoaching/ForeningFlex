# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    address "MyString"
    zip "MyString"
    city "MyString"
    phone "MyString"
    mobile "MyString"
    email "MyString"
  end
end
