class UserSessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(lists_path, message: 'Logged in successfully.')
    else
      flash.notice = "Login failed. Email or password incorrect."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(root_path, message: 'Logged out!')
  end
end
