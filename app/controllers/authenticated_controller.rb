class AuthenticatedController < ApplicationController
  before_action :authenticate_user! # Ensure user is signed in before allowing to continue
  helper_method :current_user, :user_signed_in?
  private
  def authenticate_user! # If user isn't signed in, redirect them to login.
    unless user_signed_in?
      redirect_to login_path, alert: "Please log in before continuing."
    end
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  def user_signed_in?
    current_user.present?
  end
end
