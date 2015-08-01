class TreatmentHistoriesController < ApplicationController
  before_action :set_treatment_history, only: [:show, :edit, :update, :destroy]
  before_action :set_patient
  before_filter :authenticate_user!
  
  respond_to :html

  def index
    @treatment_histories = TreatmentHistory.all
    respond_with(@treatment_histories)
  end

  def show
    respond_with(@patient,@treatment_history)
  end

  def new
    if @patient.treatment_history
      @treatment_history = @patient.treatment_history
    else
      @treatment_history = TreatmentHistory.new
      @patient.treatment_history = @treatment_history
      @treatment_history.patient = @patient
    end
    respond_with(@patient,@treatment_history)
  end

  def edit
  end

  def create
    @treatment_history = TreatmentHistory.new(treatment_history_params)
    @treatment_history.save
    respond_with(@patient,@treatment_history)
  end

  def update
    @treatment_history.update(treatment_history_params)
    respond_with(@patient,@treatment_history)
  end

  def destroy
    @treatment_history.destroy
    respond_with(@treatment_history)
  end

  private
    def set_treatment_history
      @treatment_history = TreatmentHistory.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end


    def treatment_history_params
      params.require(:treatment_history).permit(:patient_id, :is_cured, :in_month_treated, :in_year_treat_count, :na_session, :total)
    end
end
