class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    render json: Question.all
  end

  def show
    question = Question.find(params[:id])
    render json: question
  end

  def create
    question = Question.create(params.require(:question).permit(:name, :super_name))
    render json: question
  end

  def update
    question = Question.find(params[:id])
    question.update(params.require(:question).permit(:name, :super_name))
    render json: question
  end

  def destroy
    Question.destroy(params[:id])
  end

  private
  def render_not_found_response
    render json: { error: "Error" }, status: :not_found
  end

end
