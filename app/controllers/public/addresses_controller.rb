class Public::AddressesController < ApplicationController
  def index
   @addresses = Address.all
   @address = 
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "新しい配送先を登録しました."
      redirect_to '/addresses'
    else
      @address = Address.all
      render :index
    end
  end

  def update
     @address = Address.find(params[:id])
      if @address.update(address_params)
        flash[:notice] = "登録情報を更新しました."
        redirect_to '/addresses'
      else
        render :edit
        @address = Address.all
      end
  end
  

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
     redirect_to '/addresses'
  end

  private
    def address_params
      params.require(:address).permit(:post_code, :address, :address_name)
    end
end
