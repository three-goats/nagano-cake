class Members::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order_new = Order.new
    @members = Member.all
    @dest = Destination.new
  end

  def create
    @order = current_member.orders.build(order_set)
    if @order.save
      redirect_to success_orders_path
    end
  end

  def confirm
    @order = Order.new(order_params)
    @user = Member.find(current_member.id)
    if params[:address_option] == "0"
      @post = @user.post_number
      @address = @user.address
      @name = @user.last_name + @user.first_name
    elsif params[:address_option] == "1"
      @destination = Destination.find(dest_set[:id])
      @post = @destination.post_address
      @address = @destination.address
      @name = @destination.full_name
    elsif params[:address_option] == "2"
      @new_destination = Destination.new(dest_params)
      @new_destination.save
      @post = @order.post_address
      @address = @order.address
      @name = @order.full_name
    end
  end

  def success
  end

  private
  def order_params
    params.permit(:id, :payment_method, :post_address, :address, :full_name)
  end
    
  
  def order_set
    params.require(:order).permit(:payment, :payment_method, :address, :post_address, :full_name)
  end

  def dest_set
    params.permit(:id)
  end

  def dest_params
    params.permit(:id, :post_address, :address, :full_name)
  end
end
