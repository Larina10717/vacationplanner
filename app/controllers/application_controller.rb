class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def set_current_employee
    Employee.current = current_employee
  end

  protected

  def configure_permitted_parameters
    attributes = [:name,:email, :password]
    devise_parameter_sanitizer.permit(:sign_in, keys: attributes)
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end
end
