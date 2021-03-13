class HomesController < ApplicationController
  def top

  end

  def index
    @book = books.all
  end
end