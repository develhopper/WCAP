class AbusingsController < ApplicationController
  before_action :set_abusing, only: [:show, :edit, :update, :destroy]
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
    respond_with(@abusing)
  end

  def edit
  end

  def create
    @abusing = Abusing.new(abusing_params)
    @abusing.save
    respond_with(@abusing)
  end

  def update
    @abusing.update(abusing_params)
    respond_with(@abusing)
  end

  def destroy
    @abusing.destroy
    respond_with(@abusing)
  end

  private
    def set_abusing
      @abusing = Abusing.find(params[:id])
    end

    def abusing_params
      params.require(:abusing).permit(:abusing_profile_id, :drug_type, :first_use_age, :continuous_usage_duration, :count, :abusing_type, :description, :is_mainspring)
    end
end
