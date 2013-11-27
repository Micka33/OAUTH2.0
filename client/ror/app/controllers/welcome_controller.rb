class WelcomeController < ApplicationController


  def index
    token = authCli.client_credentials.get_token
    response = token.get('/posts')
    render json: {name:'This is supposed to be the converting service', reponse:response.parsed}
  end


  def convert
    redirect_to authCli.auth_code.authorize_url(:redirect_uri => 'http://rorclient.dev/callback', scope:"posts")
  end
  def callback
    token = authCli.auth_code.get_token(params[:code], :redirect_uri => 'http://rorclient.dev/callback')
    response = token.get('/posts')
    # response2 = token.get('/show')
    render json: {name:response.class.name, reponse:response.parsed}#, reponse2:response2.parsed}
  end

end
