class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  respond_to :html

  #Sets the patients to be shown. Admin(s) can see all the patients, supervisors can just see the patients of their own clinics, and examiners can see their related patients.
  def index
    if current_user.admin?
      @patients = Patient.all
    else
      @patients = current_user.related_patients
    end
    respond_with(@patients)
  end

  def show
    @registrations = @patient.registrations
    respond_with(@patient)
  end

  def new
    @related_clinics = current_user.related_clinics
    @patient = Patient.new
    respond_with(@patient)
  end

  def edit
  end

  #Creates Patient and also Registrations for User and all passed clinic_ids.
  def create
    @patient = Patient.new(patient_params)
    unless @patient.check_clinics(params[:clinic_ids], current_user)
      redirect_to patients_path
    else 
      @patient.save
      @patient.update_clinics(params[:clinic_ids], current_user)
      respond_with(@patient)
    end
  end

  def update
    @patient.update(patient_params)
    respond_with(@patient)

  end

  def destroy
    @patient.destroy
    respond_with(@patient)
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :clinic_ids)
    end
end
