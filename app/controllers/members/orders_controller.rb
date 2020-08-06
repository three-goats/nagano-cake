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
    @order_new = Order.new(oder_params)
    @user = Member.find(current_member.id)
    @destination = Destination.find(:member_id)
    if params[:address_option] == 0
      @post = @user.post_number
      @address = @user.address
      @name = @user.last_name + @user.first_name
    elsif params[:address_option] == 1
      @post = @destination.post_address
      @address = @destination.address
      @name = @destination.full_name
    else params[:address_option] == 2
      @new_destination = Destination.new
    end

  end

  def confirm
  end

  def success
  end

  private
  def oder_params
    params.require(:order)
  end
end
