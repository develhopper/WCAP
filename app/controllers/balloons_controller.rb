class BalloonsController < ApplicationController
  before_action :set_balloon
  before_filter :authenticate_user!
  respond_to :html

  def update
    @balloon.update(balloon_params)
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
