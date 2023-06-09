class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @postage = 800
    @sum = 0
    select_address = params[:order][:select_address]

    if select_address == "0"
      # 顧客本人の住所の場合
      @order = Order.new(order_params)
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.address_name = current_customer.full_name

    elsif select_address == "1"
      # 事前に登録した配送先住所を選択した場合
      @order = Order.new(order_params)
      
      if params[:order][:address_id].present?
        # 選択した住所情報を取得
        @address = Address.find(params[:order][:address_id])
        @order.post_code = @address.post_code
        @order.address = @address.address
        @order.address_name = @address.address_name
      else
        # 選択した住所が存在しない場合はリダイレクト
        redirect_to new_order_path
      end

    elsif select_address == "2"
      # 新しい配送先住所を入力する場合
      if (params[:order][:post_code] || params[:order][:address] || params[:order][:address_name]).blank?
        # 入力された住所情報が空の場合はリダイレクト
        redirect_to new_order_path
      else
        @order = Order.new(order_params)
      end

    else
      redirect_to new_order_path
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items

    if @order.save
      # 注文が保存された場合
      current_customer.cart_items.each do |cart_item|
        ordering_item = OrderingItem.new
        ordering_item.order_id = @order.id
        ordering_item.item_id = cart_item.item.id
        ordering_item.count = cart_item.count
        ordering_item.tax_included_price = cart_item.item.tax_included_price
        ordering_item.save
      end

      @cart_items.destroy_all
      # 注文が完了し、カート内商品を削除して注文完了ページへリダイレクト
      redirect_to orders_complete_path
    else
      # 注文保存に失敗した場合
      @postage = 800
      @sum = 0
      render :confirm
    end
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.orders.find(params[:id])
    @ordering_items = @order.ordering_items
    @sum = @ordering_items.inject(0) { |sum, ordering_item| sum + ordering_item.subtotal }
  end

  private

  def order_params
    params.require(:order).permit(:how_to_pay, :post_code, :address, :address_name, :postage, :total_price, :order_status)
  end
end
