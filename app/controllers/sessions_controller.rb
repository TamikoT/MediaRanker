class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user
      session[:user_id] = user.id
      flash[:notice] = "successfully logged in #{user.username}"
    else
      new_user = User.new(username: params[:username])
      new_user.save
      session[:user_id] = new_user.id
      flash[:notice] = "created a new user #{new_user.username}"
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
