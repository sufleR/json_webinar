# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    address "MyString"
    city "MyString"
    custom_fields { { a: 1, b: [1,2,3,4], c: { d: 'a'} } }
  end
end
