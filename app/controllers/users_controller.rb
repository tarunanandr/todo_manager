class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    user = User.new(firstname: first_name, lastname: last_name, email: email, password: password)
    user.save
    flash[:error] = user.errors.full_messages.join(", ")
    if flash[:error]
      redirect_back(fallback_location: "users/new") and return
    end
    session[:current_user_id] = user.id
    redirect_to "/"
  end
end
