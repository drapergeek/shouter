class SearchesController < ApplicationController
  
  def show
    if params[:search]
      @shouts = Shout.search(params[:search])
    else
      redirect_to root_url
    end
  end
end
