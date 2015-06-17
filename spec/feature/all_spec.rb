require "rails_helper"

feature "I see all cards" do
  scenario "Go on all cards page" do
    card = create(:card)
    visit root_path
    
    click_link "Карточки"
    expect(page).to have_content "Редактировать"
    expect(page).to have_content "Удалить"
  end
end