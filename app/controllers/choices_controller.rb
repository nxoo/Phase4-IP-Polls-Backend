class ChoicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    render json: Choice.all
  end

  def show
    choice = Choice.find(params[:id])
    render json: choice
  end

  def create
    choice = Choice.create(params.require(:choice).permit(:name, :super_name))
    render json: choice
  end

  def update
    choice = Choice.find(params[:id])
    choice.update(params.require(:choice).permit(:name, :super_name))
    render json: choice
  end

  def destroy
    Choice.destroy(params[:id])
  end

  private
  def render_not_found_response
    render json: { error: "Choice not found" }, status: :not_found
  end

end
