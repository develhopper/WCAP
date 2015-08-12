class TasksController < ApplicationController
  before_action :set_task, only: [:show]
  before_filter :authenticate_user!
  
  respond_to :html

  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:confirmed, :study_id, :patient_id)
    end
end
