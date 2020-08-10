class Members::HomesController < ApplicationController
  def top
  	@types = ProductsType.all
  	@product_1 = Product.find(5)
  	@product_2 = Product.find(6)
  	@product_3 = Product.find(7)
  	@product_4 = Product.find(8)
  end

  def about
  end
end
