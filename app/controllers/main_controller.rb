class MainController < ApplicationController
                       
  def index
    last_review_date = Date.today - 3.days
    # last_review_date = 1.year.ago
    start = 1.year.ago
    @cards_for_learning = Card.where(review_date: start..last_review_date )
    if @cards_for_learning.empty?
      flash[:no_cards] = "Нет карточек, приходите через день или добавьте новых"
    else
    @card = @cards_for_learning.sample
    end
  end

  def check 
    original_card = Card.find(cards_params[:card_id])
    if compare_translations(original_card.translated_text, cards_params[:translated_text])
      flash[:notice] = "Слово #{original_card.original_text} переведно верно. Молодец!"
      original_card.update_attribute(:review_date, (Date.today + 3.days))
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

  def compare_translations(original_text, submitted_text)
    original_text.mb_chars.downcase.to_s == submitted_text.mb_chars.downcase.to_s 
  end


end