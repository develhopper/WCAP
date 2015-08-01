class BasicDemographicsController < ApplicationController
  before_action :set_basic_demographic, only: [:show, :edit, :update, :destroy]
  before_action :set_patient
  before_filter :authenticate_user!  

  respond_to :html

  def index
    @basic_demographics = BasicDemographic.all
    respond_with(@basic_demographics)
  end

  def show
    respond_with(@patient,@basic_demographic)
  end

  def new
    if @patient.basic_demographic
      @basic_demographic = @patient.basic_demographic
    else
      @basic_demographic = BasicDemographic.new
      @patient.basic_demographic = @basic_demographic
      @basic_demographic.patient = @patient
    end
    respond_with(@patient,@basic_demographic)
  end

  def edit
  end

  def create
    @basic_demographic = BasicDemographic.new(basic_demographic_params)
    @basic_demographic.save
    respond_with(@patient,@basic_demographic)
  end

  def update
    @basic_demographic.update(basic_demographic_params)
    respond_with(@patient,@basic_demographic)
  end

  def destroy
    @basic_demographic.destroy
    respond_with(@basic_demographic)
  end

  private
    def set_basic_demographic
      @basic_demographic = BasicDemographic.find(params[:id])
    end
    def set_patient
      @patient = Patient.find(params[:patient_id])
    end


    def basic_demographic_params
      params.require(:basic_demographic).permit(:patient_id, :file_number, :private_code, :gender, :year_of_birth, :interview_date, :marital_status, :educational_year)
    end
end
