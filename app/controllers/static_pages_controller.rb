class StaticPagesController < ApplicationController
  def home
  	@food = Food.all
  	@current_user = session[:user]
  end

  def jobs
  end

  def about
  end

  def contact
  end
end
