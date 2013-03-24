class StaticPagesController < ApplicationController
  def home
  	@food = Food.all
  end

  def jobs
  end

  def about
  end

  def contact
  end
end
