class ReviewsController < ApplicationController
  before_action :find_card, only: [:create]
  def new
    @card = Card.pending.first
    render "reviews/new"
  end

  def create
    if @card.check_translations(review_params[:user_translation])
      flash[:notice] = "Слово #{@card.original_text} переведно верно. Молодец!"
    else
      flash[:notice] = "Слово '#{@card.original_text}' переведно с ошибкой. Но я в тебя верю ;)"
    end
    redirect_to :back
  end

  private
  def review_params
    params.require(:review).permit(:card_id, :user_translation)
  end 

  def find_card
    @card = Card.find(review_params[:card_id])
  end 
end