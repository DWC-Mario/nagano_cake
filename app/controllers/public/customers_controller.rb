class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :customer_params, only: [:update]

  def show
    @customer = current_customer
    @formatted_post_code = @customer.post_code.insert(3, "-")
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました"
      redirect_to customer_path
    else
      flash[:error] = "error!"
      flash[:notice] = @customer.errors.full_messages
      render :edit
    end
  end

  def confirm
  end

  def withdraw
    customer = current_customer
    customer.is_active = false
    customer.save
    session.clear
    redirect_to root_path
  end

  protected

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,
                          :post_code,:address,:phone_number,:email)
  end

end
