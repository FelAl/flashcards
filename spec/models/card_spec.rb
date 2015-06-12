require 'rails_helper'

RSpec.describe Card, type: :model do
  before(:each) do 
    @card = Card.create(original_text:   "Door", 
                        translated_text: "Дверь", 
                        review_date:     "05.05.2015")
  end

  it "has original_text Door" do
    expect(@card.original_text).to eq ("Door")
  end

  it "has translated_text Дверь" do
    expect(@card.translated_text).to eq ("Дверь")
  end

  it "has review_date 05.05.2015" do
    expect(@card.review_date).to eq (Date.today + 3.days)
  end
end
