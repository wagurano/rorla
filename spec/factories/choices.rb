# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :choice do
    text "MyString"
    correct false
    problem nil
  end
end
