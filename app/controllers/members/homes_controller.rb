class Members::HomesController < ApplicationController
  def top
  	@types = ProductsType.all
  end

  def about
  end
end
