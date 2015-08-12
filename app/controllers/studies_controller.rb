class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy , 
    :add_examiner, :remove_examiner, :get_examiners, :finalize, :get_patients,:add_patient]
  before_filter :authenticate_user!
  before_action :set_available_users, only: [:new,:edit, :update, :get_examiners]
  before_action :set_available_patients, only: [:get_patients]

  respond_to :html

  def index
    @studies = Study.all
    respond_with(@studies)
  end

  def show
    respond_with(@study)
  end

  def new
    @study = Study.new
    respond_with(@study)
  end

  def edit
  end

  def create
    @study = Study.new(study_params)
    @study.save
    respond_with(@study)
  end

  def update
    @study.update(study_params)
    respond_with(@study)
  end

  def destroy
    @study.destroy
    respond_with(@study)
  end

  def add_examiner
    examiner = User.find(params[:examiner_id])
    if examiner && ! @study.users.include?(examiner)
      @study.users.append(examiner)
      @study.save
    end
    render 'add_examiner.js'
  end

  def add_patient
    unless @study.finalized
      redirect_to @study
    end
    patient = Patient.find(params[:patient_id])
    if patient && ! @study.patients.include?(patient)
      @study.create_task(patient)
      @study.save
    end
    render 'add_patient.js'
  end

  def remove_examiner
    examiner = User.find(params[:examiner_id])
    if examiner && @study.users.include?(examiner)
      @study.users.delete(examiner)
      @study.save
    end
    render 'remove_examiner.js'
  end

  def finalize
    @study.finalized = true
    @study.save
    redirect_to @study
  end

  def get_examiners
    @examiners = @study.users  
  end

  def get_patients
    @patients = current_user.related_patients
  end

  private
    def set_study
      @study = Study.find(params[:id])
    end

    def set_available_users
      @users =User.all
    end

    def set_available_patients
      @patients = current_user.related_patients
    end

    def study_params
      params.require(:study).permit(:admin_id, :description, :examiner_id, :patient_id)
    end
end
