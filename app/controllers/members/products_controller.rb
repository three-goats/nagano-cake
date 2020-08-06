class Members::ProductsController < ApplicationController
  def index
  	@products = Product.where
  	@quantity = Product.count
  	# @types = ProductsType.where
  end

  def show
  	@product = Product.find(params[:id])
  	@order_product =OrderProduct.new
  	# @types = ProductsType.where
  end
end

