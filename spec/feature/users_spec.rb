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
    expect(page).to have_content "Logged out!"
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

feature "User manipulations" do
  scenario "Editing user and login" do
    create :user
    login
    click_link "Edit Profile"
    fill_in "Email", with: "edit@mail.ru"
    fill_in "Password", with: "edit"
    fill_in "Password confirmation", with: "edit"
    click_button "Update User"
    expect(page).to have_content "User was successfully updated."
    click_link "Logout"
    visit root_path
    fill_in "email", with: "edit@mail.ru"
    fill_in "password", with: "edit"
    click_button "Login" 
    expect(page).to have_content "Login successful"
  end

  scenario "Deleting user", js: true do
    user = create :user
    create(:user, email: "delete@mail.ru", password: "delete", password_confirmation: "delete")
    login
    visit "/users"

    expect(page).to have_content "Listing Users"
    expect(page).to have_content "delete@mail.ru"
    click_link "Destroy", match: :first
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "User was successfully destroyed."
  end
end




