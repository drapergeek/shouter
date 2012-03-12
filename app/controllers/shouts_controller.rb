class ShoutsController < ApplicationController

  def show
   @shout = Shout.find(params[:id]) 
  end

  def create
   @shout = current_user.shouts.create!(params[:shout]) 
   redirect_to dashboard_path, notice: "Shouted!"
  end

end
