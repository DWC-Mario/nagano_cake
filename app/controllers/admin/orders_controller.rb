class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @ordering_items = @order.ordering_items
    @sum = @ordering_items.inject(0) { |sum, ordering_item| sum + ordering_item.subtotal }
  end

  def update
    @order = Order.find(params[:id])
    @ordering_items = @order.ordering_items

    if @order.update(order_params)
      # 注文ステータスが「入金済み」の場合、関連する製品ステータスを「製作中」に更新
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
