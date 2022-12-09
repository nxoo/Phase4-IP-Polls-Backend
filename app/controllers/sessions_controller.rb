class SessionsController < ApplicationController
  def signup
    user = User.new(email: params[:email], password: params[:password])

    # if user is saved
    if user.save
      # we encrypt user info using the pre-define methods in application controller
      token = encode_user_data({ user_data: user.id })

      # return to user
      render json: { status: 201 }
    else
      # render error message
      render json: { message: "invalid credentials" }
    end
  end

end