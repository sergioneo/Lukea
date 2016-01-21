class PayBalanceController < ApplicationController
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
  def quitar_saldo
    if user_signed_in?
      @user = current_user
      if @user.saldo >= params[:cantidad].to_i
        @user.saldo -= params[:cantidad].to_i
        if @user.save
          redirect_to :back, notice: 'Saldo quitado'
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
