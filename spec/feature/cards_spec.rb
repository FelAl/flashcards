require "rails_helper"

feature "Basic training" do
  scenario "User can review card" do
    card = create(:card)
    card.update_attributes(review_date: Date.today)
    visit root_path

    click_link "тренировку"
    fill_in "review_user_translation", with: "TestTest"
    click_button("Проверить")
    expect(page).to have_content "переведено с ошибкой"
  end
end





