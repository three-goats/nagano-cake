class Members::ProductsController < ApplicationController
  def index
  	@products = Product.where(validation: true)
  	@quantity = Product.count
  	@types = ProductsType.where(validation: true)
  end

  def show
  	@product = Product.find(params[:id])
  	@order_product =OrderProduct.new
  	@types = ProductsType.where(validation: true)
  end

  
end
