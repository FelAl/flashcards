class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def create
    card = Card.new(cards_params)
    if card.save
      redirect_to root_path
    else
      flash[:notice] = "Запись не может быть сохранена"
      redirect_to root_path
    end  
  end

  private
  def cards_params
    params.require(:card).permit(:original_text, :translated_text)
  end  
end
