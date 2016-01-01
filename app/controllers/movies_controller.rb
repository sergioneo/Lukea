class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :verify_is_admin, :except => [:show, :index, :create_comment, :destroy_comment]
  before_action :set_comment, only: [:destroy_comment]
  before_action :authenticate_user!, only: [:create_comment, :destroy_comment]


  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
    @movies_categoria = Movie.where(params[:id_categoria_buscada])
    @movies_valoradas = @movies.order(:valoracion)
    @movies_categoria = @movies.order(:n_comentarios)
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @comment = Comment.new
    @comments = Comment.where(movie_id: params[:id])
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Pelicula' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Pelicula actualizada' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Pelicula eliminada' }
      format.json { head :no_content }
    end
  end

  #Comentarios

  def create_comment
    @comment = Comment.new(comment_params)
    @comment.movie_id = params[:id]
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to action: 'show', id: @comment.movie_id, notice: 'Comentario creado'
    else
      redirect_to @movie, notice: 'Comentario no creado.'
    end
  end

  def destroy_comment
    @comment.destroy
    redirect_to action:'show', id: params[:movie_id], notice: 'Eliminado el comentario'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:titulo, :descripcion, :visualizaciones, :image, :pelicula_url, category_ids: [], comments_attributes:[:contenido])
    end

    def comment_params
      params.require(:comment).permit(:contenido)
    end
end
