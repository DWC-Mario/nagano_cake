class ApplicationController < ActionController::Base
  protect_from_forgery
  private

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope == :customer
      new_customer_session_path
    else
      super
    end
  end
end
