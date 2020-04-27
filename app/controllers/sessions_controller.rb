class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to todos_path
    else
      render plain: "Credentials Incorrect!"
    end
  end

  def delete
    session[:current_user_id] = nil
    redirect_to "/"
  end
end
