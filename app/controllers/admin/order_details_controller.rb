class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order = Order.find(params[:id])
    @ordering_items = @order.ordering_items
    @ordering_item = OrderingItem.find(params[:ordering_item][:id])
    
    is_updated = true
    if @ordering_item.update(order_detail_params)
      # 製作ステータスが「製作中」の場合、注文ステータスを「製作中」に更新
      @order.update(order_status: 2) if @ordering_item.production_status == "production_now"

      # 全ての商品の中で製作ステータスが一つでも「製作完了」でない場合
      @ordering_items.each do |item|
        if item.production_status != "production_complete"
          is_updated = false
        end
      end

      # 全ての商品の製作ステータスが「製作完了」の場合、注文ステータスを「発送準備中」に更新
      @order.update(order_status: 3) if is_updated
      redirect_to admin_order_path
    end
  end

  private

  def order_detail_params
    params.require(:ordering_item).permit(:production_status)
  end
end
