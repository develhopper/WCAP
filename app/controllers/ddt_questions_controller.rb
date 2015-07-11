class DdtQuestionsController < ApplicationController
  before_action :set_ddt_question, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @ddt_questions = DdtQuestion.all
    respond_with(@ddt_questions)
  end

  def show
    respond_with(@ddt_question)
  end

  def new
    @ddt_question = DdtQuestion.new
    respond_with(@ddt_question)
  end

  def edit
  end

  def create
    @ddt_question = DdtQuestion.new(ddt_question_params)
    @ddt_question.save
    respond_with(@ddt_question)
  end

  def update
    @ddt_question.update(ddt_question_params)
    respond_with(@ddt_question)
  end

  def destroy
    @ddt_question.destroy
    respond_with(@ddt_question)
  end

  private
    def set_ddt_question
      @ddt_question = DdtQuestion.find(params[:id])
    end

    def ddt_question_params
      params.require(:ddt_question).permit(:definite_value, :indefinite_value, :risk_rate, :question_type)
    end
end
