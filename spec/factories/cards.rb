FactoryGirl.define do
  factory :card do
    original_text   { Faker::Lorem.word }
    translated_text { Faker::Name.name }
  end
end