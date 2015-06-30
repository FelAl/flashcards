class ReviewsController < ApplicationController
  def new
    @card = current_user.cards.pending.first
  end

  def create
    @card = current_user.cards.find(review_params[:card_id])
    if @card.check_translations(review_params[:user_translation])
      flash[:notice] = "Слово #{@card.original_text} переведено верно. Молодец!"
    else
      flash[:notice] = "Слово '#{@card.original_text}' переведено с ошибкой."\
                       "Но я в тебя верю ;)"
    end
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(:card_id, :user_translation)
  end
end
