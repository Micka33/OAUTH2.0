class UserController < ApplicationController

  before_filter :user_connected, :except => [:create, :connect], :if => lambda { doorkeeper_token.nil? }


  def create
    if (User.where(email: "test@provider.dev").count == 0)
      created = User.create!(email:"test@provider.dev", password:"test")
      render json: {created:created}
    else
      redirect_to "user#show"
    end
  end
  def connect
    if ((!session.has_key?(:user_email)) || (session[:user_email] == nil))
      user = User.find_by(email: "test@provider.dev")
      session[:user_email] = user.email
    end
    render json: {session:session, email:User.find_by(email: session[:user_email]).email}
  end



  # protected by authentication
  def show
    user = User.find_by(email: "test@provider.dev")
    render json: {user:user}
  end
  def disconnect
      session[:user_email] = nil
      render json: {sentence:"You have been disconnected!"}
  end
  def delete
    result = current_user.destroy
    render json: {result:result}
  end

end
