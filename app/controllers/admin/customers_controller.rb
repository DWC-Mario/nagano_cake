class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.page(params[:page]).per(10)
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(admin_customer_params)
      flash[:notice] = "Profile was successfully updated."
      redirect_to admin_customer_path
    else
      flash[:error] = "error!"
      flash[:notice] = @customer.errors.full_messages
      render :edit
    end
  end
  
  private
  
  def admin_customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,
                          :post_code,:address,:phone_number,:email, :is_active)
  end
  
end
