class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @cards = []
    else
      @cards = Card.search params[:q]
    end
  end
end
