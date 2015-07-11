class TreatmentsController < ApplicationController
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @treatments = Treatment.all
    respond_with(@treatments)
  end

  def show
    respond_with(@treatment)
  end

  def new
    @treatment = Treatment.new
    respond_with(@treatment)
  end

  def edit
  end

  def create
    @treatment = Treatment.new(treatment_params)
    @treatment.save
    respond_with(@treatment)
  end

  def update
    @treatment.update(treatment_params)
    respond_with(@treatment)
  end

  def destroy
    @treatment.destroy
    respond_with(@treatment)
  end

  private
    def set_treatment
      @treatment = Treatment.find(params[:id])
    end

    def treatment_params
      params.require(:treatment).permit(:treatment_history_id, :type, :count, :max_avoidance_day, :descriptin, :in_month_used)
    end
end
