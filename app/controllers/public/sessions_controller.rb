# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    sign_out current_admin unless current_admin.nil?
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def after_sign_in_path_for(resource)
    root_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  private
  
  def customer_state
    # 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    # アカウントを取得できなかった場合、このメソッドを終了する
    return unless @customer
    # 取得したアカウントのパスワードと入力されたパスワードが一致しているかを判別
    if @customer.valid_password?(params[:customer][:password])
      # パスワードが一致した場合の処理内容を記述する
      if @customer.is_active
        # アカウントが有効な場合の処理内容を記述する
        return
      else
        # アカウントが無効（退会済み）の場合の処理内容を記述する
        flash[:error] = "退会済みのアカウントです。"
        redirect_to  new_customer_registration_path
      end
    else
      # パスワードが一致しなかった場合の処理内容を記述する
      flash[:error] = "退会済みのアカウントです。"
      redirect_to  new_customer_registration_path
    end
  end
end
