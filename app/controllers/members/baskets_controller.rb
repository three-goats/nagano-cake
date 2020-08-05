class Members::BasketsController < ApplicationController
  def index
  	@order_products = OrderProduct.where(member_id)
  end

  def create
  	@order_product = OrderProduct.new(order_product_params)
  	@order_product.member_id = current_member.member_id
  	if @order_product.save
  	  redirect_to members_baskets_path, success: "商品をカートに追加しました。"
  	else
  	  @product = Product.find(@order_product.products_id)
  end

  def update
  end

  def destory
  end

  def alldestory
  end
end
