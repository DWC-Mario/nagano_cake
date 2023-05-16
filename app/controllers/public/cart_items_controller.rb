class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_item.all
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = current_customer.cart_item.new(cart_item_params)
    if current_customer.cart_item.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_item.find_by(item_id: params[:cart_item][:item_id])
      cart_item.count += params[:cart_item][:count].to_i
      cart_item.save
      redirect_to cart_items_path
    elsif 
      @cart_item.save
      @cart_items = current_customer.cart_item.all
      render :index
    else
      render :index
    end
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :count)
  end

end
