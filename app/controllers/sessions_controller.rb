class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       session[:gruppe_id] = @user.gruppe_id
       redirect_to '/start'
    else
       redirect_to '/login'
    end
  end

  def page_requires_login
  end

  def login
  end

  def welcome
  end

  def gem
  end

  def install
  end

  def bcrypt
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Du wurdest ausgeloggt!"
  end
 
end
