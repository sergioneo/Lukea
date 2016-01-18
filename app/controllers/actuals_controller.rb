class ActualsController < ApplicationController
  before_action :set_actual, only: [:show, :edit, :update, :destroy]

  # GET /actuals
  # GET /actuals.json
  def index
    @actuals = Actual.all
  end

  # GET /actuals/1
  # GET /actuals/1.json
  def show
  end

  # GET /actuals/new
  def new
    @actual = Actual.new
  end

  # GET /actuals/1/edit
  def edit
  end

  # POST /actuals
  # POST /actuals.json
  def create
    @actual = Actual.new(actual_params)

    respond_to do |format|
      if @actual.save
        format.html { redirect_to @actual, notice: 'Actual was successfully created.' }
        format.json { render :show, status: :created, location: @actual }
      else
        format.html { render :new }
        format.json { render json: @actual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actuals/1
  # PATCH/PUT /actuals/1.json
  def update
    respond_to do |format|
      if @actual.update(actual_params)
        format.html { redirect_to @actual, notice: 'Actual was successfully updated.' }
        format.json { render :show, status: :ok, location: @actual }
      else
        format.html { render :edit }
        format.json { render json: @actual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actuals/1
  # DELETE /actuals/1.json
  def destroy
    @actual.destroy
    respond_to do |format|
      format.html { redirect_to actuals_url, notice: 'Actual was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actual
      @actual = Actual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actual_params
      params.require(:actual).permit(:titulo, :imagen_url, :bajada, :autor, :contenido, :category_id)
    end
end
