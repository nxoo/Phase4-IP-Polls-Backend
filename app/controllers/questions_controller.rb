class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  #before_action :authentication

  def index
    render json: Question.all
  end

  def show
    question = Question.find(params[:id])
    render json: question, include: :choices
  end

  def create
    question = Question.create(params.permit(:question, :user_id))
    render json: question
  end

  def update
    question = Question.find(params[:id])
    question.update(params.permit(:question, :user_id))
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
