class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain:
      "User Details\n\n"+User.all.map {|user| user.to_displayable_content}.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: name, email: email, password: password)
    confirmation_text = "User created with id #{new_user.id}"
    render plain: confirmation_text
  end

end
