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

  scenario "User can register via twitter", js: true do
    visit root_path
    click_link "Login with Twitter"

    fill_in "session[username_or_email]", with: ENV["TWITTER_LOGIN"]
    fill_in "session[password]", with: ENV["TWITTER_PASSWORD"]
    click_button "Sign In"

    expect(page).to have_content "Logged in from Twitter!"
  end

  scenario "User can register via facebook", js: true do
    visit root_path
    click_link "Login with Facebook"

    fill_in "email", with: ENV["FACEBOOK_LOGIN"]
    fill_in "pass", with: ENV["FACEBOOK_PASSWORD"]
    click_button "Log In"

    expect(page).to have_content "Logged in from Facebook!"
  end
end