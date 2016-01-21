class PayBalanceController < ApplicationController
  
  def obtener_pelicula
    if user_signed_in?
      @movie = Movie.find(params[:movie_id])
      @user = current_user
      @user_movie = UserMovie.new
      if @user.saldo >= params[:costo].to_i
        @user_movie.movie_id = params[:movie_id].to_i
        @user_movie.user_id = @user.id
        @movie.visualizaciones += 1
        @movie.save
        if @user_movie.save
          if quitar_saldo(params[:costo].to_i)
            redirect_to :back, notice: 'Pelicula agregada.'
          else
            redirect_to :back, notice: 'Pelicula agregada pero saldo no quitado.'
          end
        else
          redirect_to movie_path(:id => params[:movie_id]), notice: 'Pelicula no agregada. Comuníquese con el administrador'
        end
      else
        redirect_to movie_path(:id => params[:movie_id]), notice: 'No tiene saldo'
      end
    else
      redirect_to new_user_session_path, notice: 'Debes iniciar sesion para obtener película'
    end
  end
  
  def agregar_saldo
    if user_signed_in?
      @user = current_user
      @user.saldo += params[:cantidad].to_i
      if @user.save
        redirect_to :back, notice: 'Saldo agregado'
      else
        redirect_to :back, notice: 'Ocurrió un error'
      end
    else
      redirect_to new_user_session_path, notice: 'Debes iniciar sesion para agregar saldo'
    end
  end
  
  private
  
  def quitar_saldo(cantidad)
    if user_signed_in?
      @user = current_user
      if @user.saldo >= cantidad.to_i
        @user.saldo -= cantidad.to_i
        if @user.save
          return true
        else
          redirect_to :back, notice: 'Ocurrió un error'
        end
      else
        redirect_to :back, notice: 'No hay saldo suficiente para quitar'
      end
    else
      redirect_to new_user_session_path, notice: 'Debes iniciar sesion para quitar saldo'
    end
  end
end
