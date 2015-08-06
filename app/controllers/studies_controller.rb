class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_action :set_available_users

  respond_to :html

  def index
    @studies = Study.all
    respond_with(@studies)
  end

  def show
    respond_with(@study)
  end

  def new
    @study = Study.new
    respond_with(@study)
  end

  def edit
  end

  def create
    @study = Study.new(study_params)
    @study.save
    respond_with(@study)
  end

  def update
    @study.update(study_params)
    respond_with(@study)
  end

  def destroy
    @study.destroy
    respond_with(@study)
  end

  private
    def set_study
      @study = Study.find(params[:id])
    end

    def set_available_users
      @users =User.all
    end

    def study_params
      params.require(:study).permit(:admin_id, :description)
    end
end
