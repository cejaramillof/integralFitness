class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_plans
  #MUSCLE_BASE_URL = "https://jhnutricion.com/"
  MUSCLE_BASE_URL = "https://evolutionfitimg.teamsystem.com/"
  $base_url = MUSCLE_BASE_URL
  
  def set_plans
    if current_user
      @all_plans = current_user.guests.where(next: Time.now)
    else
      @all_plans = []
    end
  end
  
  #check if user is admin
  def authenticate_admin!
    redirect_to '/', alert: 'No estas autorizado.' unless current_user.try(:admin?)
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :email, :password, :current_password])
  end  
end
