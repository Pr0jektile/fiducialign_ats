class SessionsController < ApplicationController
  def new
    # TODO: Render Login Form
  end

  def create
    user = User.find_by(email: params[:email].downcase) # Ensure not case-sensitive.
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, status: :see_other, notice: "Welcome, #{user.first_name}!"
    else
      flash.now[:alert] = "Invalid email or password."
      render :new, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end

end
