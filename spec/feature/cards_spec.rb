require "rails_helper"

feature "Basic training" do
  scenario "Try to learning new cards" do
    visit "/"

    click_link "тренировку"
    expect(page).to have_content 'Проверка'
    find("#review_user_translation").set "TestTest"
    find("input[value='Проверить']").click
    expect(page).to have_content 'переведено с ошибкой'
  end
end