class SessionsController < ApplicationController
  def signup
    user = User.new(email: params[:email], password: params[:password])

    # if user is saved
    if user.save
      # we encrypt user info using the pre-define methods in application controller
      token = encode_user_data({ user_data: user.id })

      # return to user
      render json: { status: 201, message: "Signup successful" }
    else
      # render error message
      render json: { status: 401, message: "Invalid Credentials" }
    end
  end

  def login
    user = User.find_by(email: params[:email])

    # you can use bcrypt to password authentication
    if user && user.password == params[:password]

      # we encrypt user info using the pre-define methods in application controller
      token = encode_user_data({ user_data: user.id })

      # return to user
      render json: { status: 200, token: token, user: user }
    else
      render json: { status: 401, message: "Invalid Credentials" }
    end
  end
end
