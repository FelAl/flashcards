class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(cards_params)
      redirect_to cards_path
    else
      render 'edit'
    end
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

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to :back
  end

  private
  def cards_params
    params.require(:card).permit(:original_text, :translated_text)
  end  
end
