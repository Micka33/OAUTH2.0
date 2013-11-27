class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_connected
    if (  session.has_key?(:user_email) ||
          !session[:user_email].nil?  || 
          (User.where(email: session[:user_email]).count == 1)
      )
      return true
    end
    redirect_to notco_path
  end

  def current_user
    # If request comes from an OAUTH2.0 client 
    if doorkeeper_token
      # If App try to request not as a user
      if (doorkeeper_token.resource_owner_id.nil?)
        # We connect as the app using the appId
        #appId = doorkeeper_token.application.uid
        user = User.find_by(email: "test@provider.dev")
      # Else App try to request as a user
      else
        user = User.find(doorkeeper_token.resource_owner_id)
      end
      # Else request comes from ourselves
    else
      user = User.find_by(email: session[:user_email])
    end
    user
  end

end
