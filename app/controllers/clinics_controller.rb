class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy, 
    :add_examiner, :remove_examiner, :get_examiners, :finalize]
  before_filter :authenticate_user!
  before_action :set_available_users, only: [:get_examiners]
  load_and_authorize_resource
  
  respond_to :html

  def index
    if current_user.admin
      @clinics = Clinic.all
    else
      @clinics = Clinic.where(:supervisor_id => current_user.id)
    end
    respond_with(@clinics)
  end

  def show
    respond_with(@clinic)
  end

  def new
    @clinic = Clinic.new
    @users = User.all
    respond_with(@clinic)
  end

  def edit
    @users = User.all
  end

  def create
    @clinic = Clinic.new(clinic_params)
    @clinic.save
    respond_with(@clinic)
  end

  def update
    @clinic.update(clinic_params)
    respond_with(@clinic)
  end

  def destroy
    @clinic.destroy
    respond_with(@clinic)
  end



  def add_examiner
    examiner = User.find(params[:examiner_id])
    if examiner && ! @clinic.users.include?(examiner)
      @clinic.users.append(examiner)
      @clinic.save
    end
    render 'add_examiner.js'
  end

  def remove_examiner
    examiner = User.find(params[:examiner_id])
    if examiner && @clinic.users.include?(examiner)
      @clinic.users.delete(examiner)
      @clinic.save
    end
    render 'remove_examiner.js'
  end

  def get_examiners
    @examiners = @clinic.users  
  end
  private
    def set_clinic
      @clinic = Clinic.find(params[:id])
    end

    def set_available_users
      @users =User.all
    end

    def clinic_params
      params.require(:clinic).permit(:name, :supervisor_id, :examiner_id)
    end
end
