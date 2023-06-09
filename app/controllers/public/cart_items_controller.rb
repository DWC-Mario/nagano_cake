class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @sum = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @item = Item.find(params[:cart_item][:item_id])
    @cart_item = current_customer.cart_items.find_by(item_id: @item.id)
    @cart_item_new = current_customer.cart_items.new(cart_item_params)

    if @cart_item.present?
      # カートアイテムが既に存在する場合、数量を追加
      @cart_item.count += @cart_item_new.count.to_i
      @cart_item.save
    else
      # カートアイテムが存在しない場合、新しいカートアイテムを作成
      @cart_item_new.save
      @cart_items = current_customer.cart_items
    end

    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :count)
  end
end
