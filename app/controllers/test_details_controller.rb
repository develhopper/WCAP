class TestDetailsController < ApplicationController
  before_action :set_test_detail, only: [:show, :edit, :update, :destroy]
  before_action :set_study

  respond_to :html

  def index
    @test_details = TestDetail.all
    respond_with(@study,@test_details)
  end

  def show
    respond_with(@study,@test_detail)
  end

  def new
    @test_detail = TestDetail.new
    respond_with(@study,@test_detail)
  end

  def edit
  end

  def create
    @test_detail = TestDetail.new(test_detail_params)
    @test_detail.study = @study
    @test_detail.save
    respond_with(@study,@test_detail)
  end

  def update
    @test_detail.update(test_detail_params)
    @test_detail.study = @study
    @test_detail.save
    respond_with(@study,@test_detail)
  end

  def destroy
    @test_detail.destroy
    respond_with(@study,@test_detail)
  end

  private
    def set_test_detail
      @test_detail = TestDetail.find(params[:id])
    end
    
    def set_study
      @study = Study.find(params[:study_id])
    end

    def test_detail_params
      params.require(:test_detail).permit(:name, :count, :part_count, :study_id)
    end
end
