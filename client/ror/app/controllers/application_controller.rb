class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authCli
    if (@client.nil?)
      @client_id = "3b76e0b9633d7205198fb056d5d0a7aae86b18a457dd991b8ef77ea9b36b7ee8"
      @client_secret = "5beff052a125018301366e575afb28ee158c10b4d1eb7c5c381c8e43cf953d44"
      @client = OAuth2::Client.new(@client_id, @client_secret, :site => 'http://provider.dev/oauth/authorize', :raise_errors => false)
    end
    @client
  end

end
