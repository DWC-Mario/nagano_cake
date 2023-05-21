class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @ordering_items = @order.ordering_items
    @ordering_items.update(order_detail_params)
    redirect_to admin_order_path
  end
end

private

def order_detail_params
  params.require(:ordering_item).permit(:production_status)
end