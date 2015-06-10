class MainController < ApplicationController
  def index
    @card = Card.last
  end
end