class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @postage = 800
    @total_price = 0
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
      @order
    else
      render :new
    end
  end

  def complete
  end

  def create

  end

  def index
  end

  def show
  end


  private

  def order_params
    params.require(:order).permit(:how_to_pay, :post_code, :address, :address_name)
  end

end
