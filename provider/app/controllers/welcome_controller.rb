class WelcomeController < ApplicationController

  doorkeeper_for :index, :scopes => [:public], :if => lambda { request.xhr? }
  before_filter :user_connected, :except => [:not_co], :if => lambda { doorkeeper_token.nil? }


  def index
    render text: 'Welcome on the Internet!<br /><a href="">Convert The file !</a>'
  end

  def not_co
    render text: "You're fucking not connected. Go to <a href=\"/connect\">/connect</a>!"
  end

end
