class Members::ProductsController < ApplicationController
  def index
  end

  def show
  	@product = Product.find(params[:id])
  	@types = ProductsType.all
  	# 仮
  	@basket_product = Product.new
  end
end
