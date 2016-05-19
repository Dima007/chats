class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:notice] = "Hello #{user.name}!"
      redirect_back_or root_path
    else
      flash.now[:alert] = "Bad credentials"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to login_path, notice: "See you!"
  end
end
