class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  respond_to :html

  def index
    @patients = Patient.all
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

  def create
    @patient = Patient.new(patient_params)
    @patient.save
    @patient.update_clinics(params[:clinic_ids], current_user)
    respond_with(@patient)
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
