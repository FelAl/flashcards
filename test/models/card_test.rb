require "rails_helper"

RSpec.describe Card, :type => :model do
  it "Card creates with valid data" do
    card = Card.create!(original_text: "Dog", translated_text: "Собака")
    
    expect(card.original_text).to eq ("Dog")    

  
end