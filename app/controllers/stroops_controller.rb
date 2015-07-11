class StroopsController < ApplicationController
  before_action :set_stroop, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @stroops = Stroop.all
    respond_with(@stroops)
  end

  def show
    respond_with(@stroop)
  end

  def new
    @stroop = Stroop.new
    respond_with(@stroop)
  end

  def edit
  end

  def create
    @stroop = Stroop.new(stroop_params)
    @stroop.save
    respond_with(@stroop)
  end

  def update
    @stroop.update(stroop_params)
    respond_with(@stroop)
  end

  def destroy
    @stroop.destroy
    respond_with(@stroop)
  end

  private
    def set_stroop
      @stroop = Stroop.find(params[:id])
    end

    def stroop_params
      params.require(:stroop).permit(:duration, :total_items, :correct_items, :finished)
    end
end
