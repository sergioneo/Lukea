class Default < ActiveRecord::Migration
  def change
  	change_column_default :movies, :valoracion, 0
  	change_column_default :movies, :n_comentarios, 0
  	change_column_default :users, :saldo, 0
  	change_column_default :users, :admin, false
  end
end
