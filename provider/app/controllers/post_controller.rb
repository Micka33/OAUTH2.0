class PostController < ApplicationController

  doorkeeper_for :all, :scopes => [:posts]#, :if => lambda { request.xhr? }
  # before_filter :user_connected, :if => lambda { doorkeeper_token.nil? }

  def index
    render json: {posts:current_user.posts, using_oauth:request.xhr?, using_session:doorkeeper_token.nil?, doorkeeper_token:doorkeeper_token}
  end
  def create
    result = current_user.posts.create!([
      { title: "I, Robot"},
      { title: "Harry Potter"},
      { title: "Hercule Poirot"},
      { title: "Elena"}
    ])
    render json: {result:result}
  end
  def delete
    result = current_user.posts.destroy_all
    render json: {result:result}
  end

end
