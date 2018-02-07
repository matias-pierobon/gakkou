class TestsController < ApplicationController
  before_action :set_course
  before_action :set_test, only: [:edit, :update, :destroy]

  # GET /tests/new
  def new
    @test = Test.new
    @test.course = @course
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  def create
    @test = Test.new(test_params)
    @test.course = @course

    if @test.save
      redirect_to @course, notice: 'Test was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tests/1
  def update
    if @test.update(test_params)
      redirect_to @course, notice: 'Test was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tests/1
  def destroy
    @test.destroy
    redirect_to tests_url, notice: 'Test was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:course_id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_params
      params.require(:test).permit(:date, :title, :min, :max)
    end
end
