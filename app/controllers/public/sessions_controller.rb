# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def customer_state
  @customer = Customer.find_by(email: params[:customer][:email])
  return if !@customer
    return redirect_to(new_customer_session_path) unless @customer.valid_password?(params[:customer][:password])
    if @customer.is_enable == false
      redirect_to(new_customer_session_path)
    else
      redirect_to(public_my_page_path)
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
