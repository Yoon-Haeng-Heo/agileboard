class ApplicationController < ActionController::Base
  helper_method :pretty_date, :pretty_time
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def pretty_date(time = nil)
    time.methods.include?(:strftime) ? time.strftime('%Y-%m-%d') : ''
  end

  def pretty_time(time = nil)
    time.methods.include?(:strftime) ? time.strftime('%Y-%m-%d %H:%M') : ''
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: User::USER_COLUMNS
    devise_parameter_sanitizer.permit :account_update, keys: User::USER_COLUMNS
  end
end
