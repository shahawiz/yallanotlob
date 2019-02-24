class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def facebook
  #    @user = User.from_omniauth(request.env["omniauth.auth"])
  #    sign_in_and_redirect @user      
  # end
  def sign_in_with(provider_name)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user, :event => :authentication
    set_flash_message(:notice, :success, :kind => provider_name) if is_navigational_format?
  end

 def facebook
	  sign_in_with "facebook"
	end
	def google_oauth2
	    sign_in_with "google"
	end
end
