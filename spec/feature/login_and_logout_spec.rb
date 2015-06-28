require "rails_helper"
require "spec_helper"

feature "Login and logout" do
  scenario "User can login with right email and password" do
    create(:user)
    login
    expect(page).to have_content "Login successful"
  end

  scenario "User can logout" do
    create(:user)
    login
    click_link "Logout"
    expect(page).to have_content "Please login first"
  end

  scenario "User can't login with wrong email" do
    create :user
    visit root_path
    fill_in "email", with: "sfasfd89899899"
    fill_in "password", with: "secret"
    click_button "Login" 
    expect(page).to have_content "Login failed"
  end

  scenario "user can't login with wrong pass" do
    create :user
    visit root_path
    fill_in "email", with: "mail@mail.ru"
    fill_in "password", with: "78738778738817"
    click_button "Login"
    expect(page).to have_content "Login failed"
  end

  scenario "user can't login with wrong pass and wrong email" do
    create :user
    visit root_path
    fill_in "email", with: "123123123123"
    fill_in "password", with: "78738778738817"
    click_button "Login"
    expect(page).to have_content "Login failed"
  end
end