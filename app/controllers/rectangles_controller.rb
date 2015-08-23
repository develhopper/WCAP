class RectanglesController < ApplicationController
  before_action :set_rectangle
  before_filter :authenticate_user!
  respond_to :html

  def update
    # params[:state] = Rectangle.state[params[:state].to_i - 1]
    # rectangle_params[:state] = Rectangle.states.keys[rectangle_params[:state].to_i - 1]
    # byebug
    @rectangle.update(rectangle_params)
    respond_with(@rectangle)
  end

  private
    def set_rectangle
      @rectangle = Rectangle.find(params[:id])
    end

    def rectangle_params
      if params[:rectangle][:state]
        params[:rectangle][:state] = Rectangle.states.keys[params[:rectangle][:state].to_i - 1]
      end
      params.require(:rectangle).permit(:id, :state, :is_clicked, :display_time, :response_time, :gonogo_id)

    end

end
