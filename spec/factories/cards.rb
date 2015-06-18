FactoryGirl.define do
  factory :card do
    original_text   { Faker::Lorem.word }
    translated_text { Faker::Name.name }
    association :user, factory: :user
  end
end