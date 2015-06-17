require "rails_helper"

feature "Editing cards" do
  scenario "Try to edit a card" do
    card = create(:card)
    visit root_path

    click_link "Карточки"
    click_link "Редактировать", :match => :first
    parsed_orig_text  = find("#card_original_text").value
    parsed_trans_text = find("#card_translated_text").value
    orig_text_random_string  = "aba"
    trans_text_random_string = "qwq"

    fill_in "card_original_text", with: orig_text_random_string
    fill_in "card_translated_text", with: trans_text_random_string
    click_button("Изменить")
    expect(page).to have_content  orig_text_random_string
    expect(page).to have_content  trans_text_random_string
  end
end