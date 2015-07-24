class TreatmentHistoriesController < ApplicationController
  before_action :set_treatment_history, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  respond_to :html

  def index
    @treatment_histories = TreatmentHistory.all
    respond_with(@treatment_histories)
  end

  def show
    respond_with(@treatment_history)
  end

  def new
    @treatment_history = TreatmentHistory.new
    respond_with(@treatment_history)
  end

  def edit
  end

  def create
    @treatment_history = TreatmentHistory.new(treatment_history_params)
    @treatment_history.save
    respond_with(@treatment_history)
  end

  def update
    @treatment_history.update(treatment_history_params)
    respond_with(@treatment_history)
  end

  def destroy
    @treatment_history.destroy
    respond_with(@treatment_history)
  end

  private
    def set_treatment_history
      @treatment_history = TreatmentHistory.find(params[:id])
    end

    def treatment_history_params
      params.require(:treatment_history).permit(:patient_id, :is_cured, :in_month_treated, :in_year_treat_count, :na_session, :total)
    end
end
