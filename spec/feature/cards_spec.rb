require "rails_helper"

feature "Basic training" do
  scenario "Try to learning new cards" do
    visit root_path

    click_link "тренировку"
    expect(page).to have_content 'Проверка'
    fill_in "review_user_translation", with: "TestTest"
    click_button("Проверить")
    expect(page).to have_content 'переведено с ошибкой'
  end
end