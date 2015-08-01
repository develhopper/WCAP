class AbusingProfilesController < ApplicationController
  before_action :set_abusing_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_patient 
  before_filter :authenticate_user!
  respond_to :html

  def index
    @abusing_profiles = AbusingProfile.all
    respond_with(@abusing_profiles)
  end

  def show
    respond_with(@abusing_profile)
  end

  def new
    if @patient.abusing_profile
      @abusing_profile = @patient.abusing_profile
    else
      @abusing_profile = AbusingProfile.new
      @patient.abusing_profile = @abusing_profile
      @abusing_profile.patient = @patient
    end
    respond_with(@abusing_profile)
  end

  def edit
  end

  def create
    @abusing_profile = AbusingProfile.new(abusing_profile_params)
    @abusing_profile.save
    respond_with(@abusing_profile)
  end

  def update
    @abusing_profile.update(abusing_profile_params)
    respond_with(@abusing_profile.patient)
  end

  def destroy
    @abusing_profile.destroy
    respond_with(@abusing_profile)
  end

  private
    def set_abusing_profile
      set_patient
      @abusing_profile = @patient.abusing_profile
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end 

    def abusing_profile_params
      params.require(:abusing_profile).permit(:cost_per_month, :overdose_count, :freakout_count, :patient_id)
    end
end
