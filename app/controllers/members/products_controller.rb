class Members::ProductsController < ApplicationController
  def index
  	@products = Product.where(validation: true)
  	@quantity = Product.count
  	@types = ProductsType.where(validation: true)
  end

  def show
  	@product = Product.find(products_params[:id])
  	@order_product =OrderProduct.new
  	@types = ProductsType.where(validation: true)
  end

  private
  def products_params
  	params.require(:product).permit(:name, :explanation, :sales_status, :product_type_id, :unit_price)
  end
end
end
