require "rails_helper"

feature "Basic training" do
  scenario "User can review card" do
    card = build(:card)
    card.save
    visit root_path

    click_link "тренировку"
    fill_in "review_user_translation", with: "TestTest"
    click_button("Проверить")
    expect(page).to have_content "переведено с ошибкой"
  end
end

feature "I see all cards" do
  scenario "Go on all cards page" do
    card = build(:card)
    card.save
    visit root_path

    click_link "Карточки"
    expect(page).to have_content "Редактировать"
    expect(page).to have_content "Удалить"
  end
end

feature "Editing cards" do
  scenario "Try to edit a card" do
    card = build(:card)
    card.save
    visit root_path

    click_link "Карточки"
    click_link "Редактировать", :match => :first
    parsed_orig_text  = find("#card_original_text").value
    parsed_trans_text = find("#card_translated_text").value
    additional_string_length = 3
    orig_text_random_string  = parsed_orig_text  + rand(36**additional_string_length).to_s(36)
    trans_text_random_string = parsed_trans_text + rand(36**additional_string_length).to_s(36)

    fill_in "card_original_text", with: orig_text_random_string
    fill_in "card_translated_text", with: trans_text_random_string
    click_button("Изменить")
    expect(page).to have_content  orig_text_random_string
    expect(page).to have_content  trans_text_random_string
  end
end





