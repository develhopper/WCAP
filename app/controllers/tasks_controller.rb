class TasksController < ApplicationController
  before_action :set_task, only: [:show,:set_current]
  before_filter :authenticate_user!
  
  respond_to :html

  #Sets the Tasks to be shown. Admin(s) can see all the tasks, supervisors can just see the patients of their own clinics' tasks, and examiners can see their related patients' tasks.
  def index
    @tasks = Task.all.order("id DESC")
    unless current_user.admin
      @tasks = []
      Task.all.order("id DESC").each do |task|
        if current_user.related_patients.include? task.patient
          @tasks.append(task)
        end
      end
    end
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  #Assigns this task to the current task of current user
  def set_current
    current_user.current_task = @task
    current_user.save
    redirect_to tasks_path
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:study_id, :patient_id)
    end
end
