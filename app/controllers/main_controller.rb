class MainController < ApplicationController
                       
  def index
    @card = Card.new
  end
end