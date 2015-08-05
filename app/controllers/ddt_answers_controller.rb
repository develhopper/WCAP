class DdtAnswersController < ApplicationController
  before_action :set_ddt_answer
  before_action :set_ddt

  

  def update
    # @ddt_answer.update(params[:response])
    @ddt_answer.response = params[:response]
    @ddt_answer.save
    byebug
    render 'edit.js'
  end


  private
    def set_ddt_answer
      @ddt_answer = DdtAnswer.find(params[:id])
    end
    def set_ddt
      @ddt = Ddt.find(params[:ddt_id])
    end

    def ddt_answer_params
      params[:ddt_id,:id,:response]
    end
end
