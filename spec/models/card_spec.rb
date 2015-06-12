require 'rails_helper'

RSpec.describe Card, type: :model do
  it "is valide with original_text, translated_text" do
    card = Card.new(original_text:   "Door", 
                    translated_text: "Дверь")
    expect(card).to be_valid
  end

  it "is invalide without original_text" do
    card = Card.new(translated_text: "Дверь")
    expect(card.valid?).to be_valid
  end

  it "is invalide without translated_text" do
    card = Card.new(original_text: "Door")
    expect(card.valid?).to eq(false)
  end

  it "is invalide without translated_text and original_text" do
    card = Card.new()
    expect(card.valid?).to eq(false)
  end

  it "has valide review_date" do
    card = Card.new(original_text:   "Door", 
                    translated_text: "Дверь")
    expect(card.review_date).to eq(Date.today + 3.days)
  end

  it "has different original_text and translated_text" do
    card = Card.new(original_text:   "Door", 
                    translated_text: "Door")
    expect(card.valid?).to eq(false)
  end
end
