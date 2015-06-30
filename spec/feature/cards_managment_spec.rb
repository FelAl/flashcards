require "rails_helper"

feature "Editing cards" do
  scenario "Try to edit a card" do
    create(:card)
    login
    click_link "Карточки"
    click_link "Редактировать", match: :first

    fill_in "card_original_text", with: "Лошадь"
    fill_in "card_translated_text", with: "Horse"
    click_button("Изменить")
    expect(page).to have_content  "Лошадь"
    expect(page).to have_content  "Horse"
  end
end

feature "I see all cards" do
  scenario "Go on all cards page" do
    create(:card)
    login
    click_link "Карточки"
    expect(page).to have_content "Редактировать"
    expect(page).to have_content "Удалить"
  end
end
