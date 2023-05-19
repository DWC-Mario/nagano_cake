class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @postage = 800
    @sum = 0
    @order = Order.new(order_params)
    select_address = params[:order][:select_address]
    if select_address == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.address_name = current_customer.full_name
    elsif select_address == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.address_name = @address.address_name
    elsif select_address == "2"
      @order = Order.new(order_params)
    else
      render :new
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    if @order.save
      @cart_items.destroy_all
      redirect_to orders_complete_path
    else
      @postage = 800
      @sum = 0
      render :confirm
    end
  end

  def index
    @orders = current_customer.orders
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:how_to_pay, :post_code, :address, :address_name, :postage, :total_price, :order_status)
  end

end
