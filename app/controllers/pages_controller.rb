class PagesController < ApplicationController
  def welcome
    @header = "Welcome"
  end

  def about
    @header = "what is it about ?"
  end

  def contest
    flash[:notice] = "sorry, the contest has ended"
    redirect_to welcome_url
  end

  def secrets
    magic_word = "sezame"
    if params[:magic_word] != magic_word
      flash[:alert] = "Sorry, you're not authorized to see that page!"
      redirect_to welcome_url
    end
  end

  before_action :set_kitten_url, only: [:kitten, :kittens]
  def kitten
  end

  def kittens
  end

  def set_kitten_url
    requested_size = params[:size]
    @kitten_url = "http://placekitten.com/#{requested_size}/#{requested_size}"
  end
end
