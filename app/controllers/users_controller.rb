class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain:
      "User Details\n\n"+User.all.map {|user| user.to_displayable_content}.join("\n")
  end
end
