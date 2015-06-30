require "rails_helper"
require "spec_helper"

feature "User manipulations" do
  scenario "Editing user and login" do
    create :user
    login
    click_link "Edit Profile"
    fill_in "Email", with: "edit@mail.ru"
    fill_in "Password", with: "edit"
    fill_in "Password confirmation", with: "edit"
    click_button "Save Profile"
    expect(page).to have_content "User was successfully updated."
    click_link "Logout"
    visit root_path
    fill_in "email", with: "edit@mail.ru"
    fill_in "password", with: "edit"
    click_button "Login" 
    expect(page).to have_content "Login successful"
  end

  scenario "User can see his email" do
    create :user
    login
    click_link "Edit Profile"
    click_link "Show"

    expect(page).to have_content "Email"
    expect(page).to have_content "mail@mail.ru"
  end
end
