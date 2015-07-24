class AbusingProfilesController < ApplicationController
  before_action :set_abusing_profile, only: [:show, :edit, :update, :destroy]
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
    @abusing_profile = AbusingProfile.new
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
    respond_with(@abusing_profile)
  end

  def destroy
    @abusing_profile.destroy
    respond_with(@abusing_profile)
  end

  private
    def set_abusing_profile
      @abusing_profile = AbusingProfile.find(params[:id])
    end

    def abusing_profile_params
      params.require(:abusing_profile).permit(:cost_per_month, :overdose_count, :freakout_count, :patient_id)
    end
end
