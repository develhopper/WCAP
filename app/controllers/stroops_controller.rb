class StroopsController < ApplicationController
  before_action :set_stroop, only: [:show, :edit, :update, :destroy, :restart]
  before_filter :authenticate_user!

  layout false , except: [:index, :show]

  respond_to :html

  def index
    @stroops = Stroop.all
    respond_with(@stroops)
  end

  def show
    respond_with(@stroop)
  end

  def edit
  end

  def restart
    @stroop.finished = false
    @stroop.save
    respond_with(@stroop)
  end

  def update
    @stroop.update(stroop_params)
    @stroop.finished = true
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
