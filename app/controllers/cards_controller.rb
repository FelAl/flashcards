class CardsController < ApplicationController

  def index
    @cards = Card.all
  end

  def create
    a = Card.new
    a['original_text']        = params['original_text']
    a['translated_text'] = params['translated_text']
    a.save
    render 'main/index'
  end
end
