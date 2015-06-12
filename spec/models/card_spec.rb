require 'rails_helper'

RSpec.describe Card, type: :model do
  it "is valide with original_text, translated_text" do
    card = Card.new(original_text:   "Door", 
                    translated_text: "Дверь")
    expect(card).to be_valid
  end

  it "is invalide without original_text" do
    card = Card.new(translated_text: "Дверь")
    expect(card.valid?).to eq(false)
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

  it "has different original_text and translated_text(Russian)" do
    card = Card.new(original_text:   "Дверь", 
                    translated_text: "Дверь")
    expect(card.valid?).to eq(false)
  end

  it "is NOT include in pending list, with incorrect date" do
    card = Card.new(original_text:   "Review", 
                    translated_text: "Оценка")
    #card.review_date == (Date.today + 3.days), after_initialize if new_record
    card.save
    expect(Card.pending).not_to include(card)
  end

  it "is include in pending list, with correct date" do
    card = Card.new(original_text:   "Review", 
                    translated_text: "Оценка")
    #card.review_date == (Date.today + 3.days), after_initialize if new_record
    card.review_date = Date.today - 20.days
    card.save
    expect(Card.pending).to include(card)
  end

  it "is include in pending list, if review_date equals #{Date.today - 4.days}" do
    card = Card.new(original_text:   "Review", 
                    translated_text: "Оценка")
    #card.review_date == (Date.today + 3.days), after_initialize if new_record
    card.review_date = Date.today - 4.days
    card.save
    expect(Card.pending).to include(card)
  end

  it "is NOT include in pending list, if review_date equals #{Date.today - 3.days}" do
    card = Card.new(original_text:   "Review", 
                    translated_text: "Оценка")
    #card.review_date == (Date.today + 3.days), after_initialize if new_record
    card.review_date = Date.today - 3.days
    card.save
    expect(Card.pending).not_to include(card)
  end

  it "is NOT include in pending list, if review_date equals #{Date.today}" do
    card = Card.new(original_text:   "Review", 
                    translated_text: "Оценка")
    #card.review_date == (Date.today + 3.days), after_initialize if new_record
    card.review_date = Date.today
    card.save
    expect(Card.pending).not_to include(card)
  end

end
