class Members::ProductsController < ApplicationController
  def index
  	# @products = Product.where(activated: true).search(params[:products_type_id])
    @products = Product.where(products_type_id: params[:products_type_id])
  	@quantity = @products.count
  	@types = ProductsType.all
  end

  def show
  	@product = Product.find(params[:id])
  	@order_product = OrderProduct.new
  	@types = ProductsType.all
  end
end

