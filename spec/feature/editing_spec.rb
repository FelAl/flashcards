require "rails_helper"

feature "Editing cards" do
  scenario "Try to edit a card" do
    card = create(:card)
    visit root_path

    click_link "Карточки"
    click_link "Редактировать", :match => :first

    fill_in "card_original_text", with: "aba"
    fill_in "card_translated_text", with: "qwq"
    click_button("Изменить")
    expect(page).to have_content  orig_text_random_string
    expect(page).to have_content  trans_text_random_string
  end
end