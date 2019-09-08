class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name,
                                                       :last_name_kana, :first_name_kana, :birth_year,
                                                       :birth_month, :birth_date])
  end
end
