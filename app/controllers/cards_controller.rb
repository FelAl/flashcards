class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def create
    card = Card.new(cards_params)
    card['review_date'] = Date.today
    card.save
    render "main/index"
  end

  private
  def cards_params
    params.require(:card).permit(:original_text, :translated_text)
  end  
end