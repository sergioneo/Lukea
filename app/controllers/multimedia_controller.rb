class MultimediaController < ApplicationController
  before_action :set_multimedium, only: [:show, :edit, :update, :destroy]

  # GET /multimedia
  # GET /multimedia.json
  def index
    @multimedia = Multimedium.all
  end

  # GET /multimedia/1
  # GET /multimedia/1.json
  def show
  end

  # GET /multimedia/new
  def new
    @multimedium = Multimedium.new
  end

  # GET /multimedia/1/edit
  def edit
  end

  # POST /multimedia
  # POST /multimedia.json
  def create
    @multimedium = Multimedium.new(multimedium_params)
    @multimedium.video_url = @multimedium.video_url.split('=').last

    respond_to do |format|
      if @multimedium.save
        format.html { redirect_to @multimedium, notice: 'Multimedium was successfully created.' }
        format.json { render :show, status: :created, location: @multimedium }
      else
        format.html { render :new }
        format.json { render json: @multimedium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multimedia/1
  # PATCH/PUT /multimedia/1.json
  def update
    respond_to do |format|
      if @multimedium.update(multimedium_params)
        format.html { redirect_to @multimedium, notice: 'Multimedium was successfully updated.' }
        format.json { render :show, status: :ok, location: @multimedium }
      else
        format.html { render :edit }
        format.json { render json: @multimedium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multimedia/1
  # DELETE /multimedia/1.json
  def destroy
    @multimedium.destroy
    respond_to do |format|
      format.html { redirect_to multimedia_url, notice: 'Multimedium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multimedium
      @multimedium = Multimedium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multimedium_params
      params.require(:multimedium).permit(:imagen, :titulo, :video_url)
    end
end
