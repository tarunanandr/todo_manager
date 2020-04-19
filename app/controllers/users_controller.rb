class UsersController < ApplicationController
  def new
    render "users/new"
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    User.create!(firstname: first_name, lastname: last_name, email: email, password: password)
    redirect_to "/"
  end
end
