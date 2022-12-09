class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    user = User.all
    render json: user, include: :questions
  end

  def show
    user = User.find(params[:id])
    render json: user, include: :questions
  end

  private
  def render_not_found_response
    render json: { error: "Error" }, status: :not_found
  end
end
