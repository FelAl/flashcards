require "rails_helper"

feature "Basic training" do
  scenario "User can view OK result when answers right" do
    card = create(:card, original_text: "Дом", translated_text: "House")
    card.update_attributes(review_date: Date.today)
    login

    click_link "тренировку"
    fill_in "review_user_translation", with: "House"
    click_button("Проверить")
    expect(page).to have_content "переведено верно"
  end

  scenario "User can view Fault result when answers wrong" do
    card = create(:card)
    card.update_attributes(review_date: Date.today)
    login

    click_link "тренировку"
    fill_in "review_user_translation", with: "TestTest"
    click_button("Проверить")
    expect(page).to have_content "переведено с ошибкой"
  end

  scenario "check case sensitivity" do
    card = create(:card, original_text: "Дом", translated_text: "House")
    card.update_attributes(review_date: Date.today)
    login

    click_link "тренировку"
    fill_in "review_user_translation", with: "houSE"
    click_button("Проверить")
    expect(page).to have_content "переведено верно"
  end
end

