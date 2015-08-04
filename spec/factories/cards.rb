FactoryGirl.define do
  factory :card do
    original_text   { Faker::Lorem.word }
    translated_text { Faker::Name.name }
    image_card      File.open("default_img.jpg")
    association :user, factory: :user
  end
end
