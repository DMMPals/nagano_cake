class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters , if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Customer
      public_my_page_path
    when Admin
      admin_root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when Customer
      public_root_path
    when Admin
      new_admin_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surname, :name, :surname_kana, :name_kana, :post, :address, :tel])
  end
end
