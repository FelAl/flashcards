require "rails_helper"
require "spec_helper"

feature "Registration" do
  scenario "User can became registered" do
    visit root_path
    click_link "Register"
    fill_in "Email", with: "new_user@mail.ru"
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    click_button "Create User"

    expect(page).to have_content "User was successfully created"
    expect(page).to have_content "Logout"
  end
end

