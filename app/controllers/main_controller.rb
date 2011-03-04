class MainController < ApplicationController
  def index
  end

  def buy
   if params["confirm"]
    
   end
   redirect_to root_path
  end
end
