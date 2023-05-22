class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    if params[:customer_id].present?
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders.order(id: :desc).page(params[:page]).per(10)
    else
      @orders = Order.order(id: :desc).page(params[:page]).per(10)
    end
  end
end
