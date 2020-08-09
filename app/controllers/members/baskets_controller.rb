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
  	  render 'member/products/show'
  	 end
  end

  def update
  	@order_products = OrderProduct.find(params[:id])
  	if @order_product.update(order_product_params)
  	   redirect_to members_baskets_path, success: "個数を変更しました。"
  	else
  		render :index, danger: "個数の変更に失敗しました。"
  	end
  end

  def destory
  	@order_products = OrderProduct.find(params[:id])
  	if @order_products.destory
  	     redirect_to members_baskets_path, success: "商品の削除が完了しました。"
  	else
  		render :index, danger: "商品の削除ができませんでした。"
  	end
  end

  def alldestory
  	member = Member.find(current_member.id)
  	if member.order_products.destroy.all
  	   redirect_to members_baskets_path, success: "全商品の削除が完了しました。"
  	else
  		render :index, danger: "全商品の削除ができませんでした。"
  	end
  end

  private
  def order_product_params
  	params.require(:order_product)
end
