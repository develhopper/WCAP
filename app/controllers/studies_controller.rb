class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy , 
    :add_examiner, :remove_examiner, :get_examiners, :finalize, 
    :get_patients, :add_patient, :add_ddt_question , :get_ddt_questions, :remove_ddt_question]
  before_filter :authenticate_user!
  before_action :set_available_users, only: [:new,:edit, :update, :get_examiners]
  before_action :set_available_patients, only: [:get_patients]
  load_and_authorize_resource

  respond_to :html

  def index
    if current_user.admin
      @studies = Study.all
    else
      @studies = current_user.related_studies
    end
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

  #Adds examiner to a Study, if has not already been a member of that
  def add_examiner
    examiner = User.find(params[:examiner_id])
    if examiner && ! @study.users.include?(examiner)
      @study.users.append(examiner)
      @study.save
    end
    render 'add_examiner.js'
  end

  #Adds patient to a Study, if has not already been a member of that
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

  #Removes one the specified examiners from Study
  def remove_examiner
    examiner = User.find(params[:examiner_id])
    if examiner && @study.users.include?(examiner)
      @study.users.delete(examiner)
      @study.save
    end
    render 'remove_examiner.js'
  end

  #Finalizes the status of Study
  def finalize
    @study.finalized = true
    @study.save
    redirect_to @study
  end

  #Returns examiners of Study
  def get_examiners
    @examiners = @study.users  
  end

  #Adds a DdtQuestion to Study if has not been finalized yet
  def add_ddt_question
    if @study.finalized
      redirect_to @study
    end
    ddt_question = DdtQuestion.find(params[:ddt_question_id])
    if ddt_question && !@study.ddt_questions.include?(ddt_question)
      @study.ddt_questions.append(ddt_question)
      @study.save
    end
    render 'add_ddt_question.js'
  end

  #Removes a DdtQuestion from Study if has not been finalized yet
  def remove_ddt_question
    if @study.finalized
      redirect_to @study
    end
    ddt_question = DdtQuestion.find(params[:ddt_question_id])
    if ddt_question && @study.ddt_questions.include?(ddt_question)
      @study.ddt_questions.delete(ddt_question)
      @study.save
    end
    render 'remove_ddt_question.js'
  end

  #Returns all the DdtQuestions
  def get_ddt_questions
    @ddt_questions = DdtQuestion.all
  end

  #If current user is supervisor, returns the patients of her clinic, and if examiner, returns her related patients.
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
      params.require(:study).permit(:admin_id, :description, :examiner_id, :patient_id, :ddt_question_id)
    end
end
