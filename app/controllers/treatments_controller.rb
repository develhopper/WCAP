class TreatmentsController < ApplicationController
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]
  before_action :set_treatment_history
  before_action :set_patient
  before_filter :authenticate_user!
  
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
    @treatment_history.treatments << @treatment
    @treatment.treatment_history = @treatment_history
    respond_with(@treatment)
  end

  def edit
  end

  def create
    @treatment = Treatment.new(treatment_params)
    @treatment.save
    respond_with(@patient,@treatment_history,@treatment)
  end

  def update
    @treatment.update(treatment_params)
    respond_with(@patient,@treatment_history,@treatment)
  end

  def destroy
    @treatment.destroy
    redirect_to patient_treatment_history_path(@patient, @treatment_history)
  end

  private
    def set_treatment
      @treatment = Treatment.find(params[:id])
    end

    def set_treatment_history
      @treatment_history = TreatmentHistory.find(params[:treatment_history_id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def treatment_params
      params.require(:treatment).permit(:patient_id,:treatment_history_id, :treatment_type, :count, :max_avoidance_day, :descriptin, :in_month_used)
    end
end
