class HomePageController < ApplicationController
  def index
    
  end

  def profile
    @user = User.find(params[:id])
  end
  
end
