class ReviewsController < ApplicationController

  def new_training
    last_review_date = Date.today - 3.days
    # last_review_date = 1.year.ago
    start = 1.year.ago
    @cards_for_learning = Card.where(review_date: start..last_review_date )
    if @cards_for_learning.empty?
      flash[:no_cards] = "Нет карточек, приходите через день или добавьте новых"
    else
    @card = @cards_for_learning.sample
    end
    render "main/index"
  end

  def check_card
    original_card = Card.find(cards_params[:card_id])
    if original_card.compare_translations(cards_params[:translated_text])
      flash[:notice] = "Слово #{original_card.original_text} переведно верно. Молодец!"
      redirect_to :back
    else
      flash[:notice] = "Слово '#{original_card.original_text}' переведно с ошибкой. Но я в тебя верю ;)"
      redirect_to :back
    end
  end

  private
  def cards_params
    params.require(:card).permit(:card_id, :translated_text)
  end  

end