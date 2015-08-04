class BalloonsController < ApplicationController
  before_action :set_balloon, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html

  def index
    @balloons = Balloon.all
    respond_with(@balloons)
  end

  def show
    respond_with(@balloon)
  end

  def new
    @balloon = Balloon.new
    respond_with(@balloon)
  end

  def create
    @balloon = Balloon.new(balloon_params)
    @balloon.save
    respond_with(@balloon)
  end

  def update
    @balloon.update(balloon_params)
    respond_with(@balloon)
  end

  def destroy
    @balloon.destroy
    respond_with(@balloon)
  end

  private
    def set_balloon
      @balloon = Balloon.find(params[:id])
    end

    def balloon_params
      params.require(:balloon).permit(:bart_id, :pumps, :explosion, :response_time)
    end
end
