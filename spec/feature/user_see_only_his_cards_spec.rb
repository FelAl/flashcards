require "rails_helper"
require "spec_helper"

feature "User see only his cards" do
  scenario "one user can't see card of another" do
    first_user = create(:user, email: "first@mail.ru", password: "111", password_confirmation: "111")
    create(:card, original_text: "first", translated_text: "первый", user: first_user)
    second_user = create(:user, email: "second@mail.ru", password: "111", password_confirmation: "111")
    create(:card, original_text: "second", translated_text: "второй", user: second_user)

    visit root_path
    fill_in "email", with: "first@mail.ru"
    fill_in "password", with: "111"
    click_button "Login"
    click_link   "Карточки"
    expect(page).to have_content "first"
    expect(page).not_to have_content "second"
  end
end