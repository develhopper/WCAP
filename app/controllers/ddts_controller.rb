class DdtsController < ApplicationController
  before_action :set_ddt, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  respond_to :html

  def index
    @ddts = Ddt.all
    respond_with(@ddts)
  end

  def show
    respond_with(@ddt)
  end

  def new
    @ddt = Ddt.new
    respond_with(@ddt)
  end

  def edit
  end

  def create
    @ddt = Ddt.new(ddt_params)
    @ddt.save
    respond_with(@ddt)
  end

  def update
    @ddt.update(ddt_params)
    respond_with(@ddt)
  end

  def destroy
    @ddt.destroy
    respond_with(@ddt)
  end

  private
    def set_ddt
      @ddt = Ddt.find(params[:id])
    end

    def ddt_params
      params[:ddt]
    end
end
