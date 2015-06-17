require "rails_helper"

feature "Basic training" do
  scenario "User can review card without mistake" do
    card = create(:card, original_text: "qwe", translated_text: "bbc")
    card.update_attributes(review_date: Date.today)
    visit root_path

    click_link "тренировку"
    fill_in "review_user_translation", with: "bbc"
    click_button("Проверить")
    expect(page).to have_content "переведено верно"
  end
end

