class ReviewsController < ApplicationController
  before_action :find_card, only: [:create]
  def new
    @card = Card.pending.first
    render "main/index"
  end

  def create
    if @card.check_translations(cards_params[:translated_text])
      flash[:notice] = "Слово #{@card.original_text} переведно верно. Молодец!"
      redirect_to :back
    else
      flash[:notice] = "Слово '#{@card.original_text}' переведно с ошибкой. Но я в тебя верю ;)"
      redirect_to :back
    end
  end

  private
  def cards_params
    params.require(:card).permit(:card_id, :translated_text)
  end 

  def find_card
    @card = Card.find(cards_params[:card_id])
  end 
end