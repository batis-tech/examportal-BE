class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

include DeviseTokenAuth::Concerns::SetUserByToken

 wrap_parameters false


protected


 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:userType,:name])
   devise_parameter_sanitizer.permit(:account_update, keys: [:userType,:name])
 end
end
