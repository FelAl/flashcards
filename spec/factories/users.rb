FactoryGirl.define do
  factory :user do
    email   "mail@mail.ru"
    password "secret"
    password_confirmation "secret"
  end
end