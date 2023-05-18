class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm

    @order = Order.new(order_params)
    select_address = params[:order][:select_address]

    if select_address == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.customer.name = current_customer.full_name
    elsif select_address == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.customer.name = @address.name
    elsif select_address == "2"
      @order
    else
      render :new
    end

    if @order.valid?
      render :confirm
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
