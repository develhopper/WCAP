class BartsController < ApplicationController
  before_action :set_bart, only: [:show, :edit, :update, :destroy, :restart, :finish]
  before_filter :authenticate_user!

  layout false , except: [:index, :new, :show]

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

  #Marks the bart as finished
  def finish
    @bart.finished = true
    @bart.save
    respond_with(@bart)
  end

  #Changes the bart state to NOT FINISHED, so the patient can take the test for another time
  def restart
    @bart.finished = false
    @bart.save
    respond_with(@bart)
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
