class BartsController < ApplicationController
  before_action :set_bart, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  respond_to :html

  def index
    @barts = Bart.all
    respond_with(@barts)
  end

  def show
    respond_with(@bart)
  end

  def new
    @bart = Bart.new
    respond_with(@bart)
  end

  def edit
  end

  def create
    @bart = Bart.new(bart_params)
    @bart.save
    respond_with(@bart)
  end

  def update
    @bart.update(bart_params)
    respond_with(@bart)
  end

  def destroy
    @bart.destroy
    respond_with(@bart)
  end

  private
    def set_bart
      @bart = Bart.find(params[:id])
    end

    def bart_params
      params[:bart]
    end
end
