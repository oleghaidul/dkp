class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def list
    @title = "List"
    @tankman = Tankman.order("rate DESC").limit(10)
    @history = History.where(:tankman_id => @tankman)
  end

  def tankmen
    @title = "Tankmen"
  end

  def awards

  end

  def calc
    @title = "Calc"
     @tankmen = Tankman.all
     @rate_sum = Tankman.sum :rate
     @gold = params[:gold]
  end

end
