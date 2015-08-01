class AbusingsController < ApplicationController
  before_action :set_abusing, only: [:show, :edit, :update, :destroy]
  before_action :set_abusing_profile
  before_action :set_patient
  before_filter :authenticate_user!
  
  respond_to :html

  def index
    @abusings = Abusing.all
    respond_with(@abusings)
  end

  def show
    respond_with(@abusing)
  end

  def new
    @abusing = Abusing.new
    @abusing.abusing_profile = @abusing_profile
    @abusing_profile.abusings << @abusing
    respond_with(@abusing)
  end

  def edit
  end

  def create
    @abusing = Abusing.new(abusing_params)
    @abusing.save
    respond_with(@patient,@abusing_profile,@abusing)
  end

  def update
    @abusing.update(abusing_params)
    respond_with(@patient,@abusing_profile)
  end

  def destroy
    @abusing.destroy
    redirect_to patient_abusing_profile_path(@patient, @abusing_profile)
  end

  private
    def set_abusing
      @abusing = Abusing.find(params[:id])
    end

    def set_abusing_profile
      @abusing_profile = AbusingProfile.find(params[:abusing_profile_id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def abusing_params
      params.require(:abusing).permit(:patient_id,:abusing_profile_id, :drug_type, :first_use_age, :continuous_usage_duration, :count, :abusing_type, :description, :is_mainspring)
    end
end
