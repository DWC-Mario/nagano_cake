class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @formatted_post_code = @order.post_code.insert(3, "-")
    @ordering_items = @order.ordering_items
    @sum = @ordering_items.inject(0) { |sum, ordering_item| sum + ordering_item.subtotal }
  end

  def update
    @order = Order.find(params[:id])
    @ordering_items = @order.ordering_items
    if @order.update(order_params)
      @ordering_items.update_all(production_status: 1) if @order.order_status == "paid_up"
      redirect_to admin_order_path
    else
      render :show
    end
  end


private

  def order_params
    params.require(:order).permit(:order_status)
  end
  
end