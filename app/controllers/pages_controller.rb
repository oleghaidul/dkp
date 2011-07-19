class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def list
    @title = "List"
    @tankman = Tankman.order("rate DESC").limit(10)
    @history = History.where(:tankman_id => @tankman)
  end

  def stat
    @title = "Statistics"
  end

  def tankmen
    @title = "Tankmen"
  end

end
