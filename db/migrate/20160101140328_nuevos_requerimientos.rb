class NuevosRequerimientos < ActiveRecord::Migration
  def change
  	add_column :users, :saldo, :integer
  	add_column :users, :nombre, :string
  	add_column :users, :foto_url, :string
  	add_column :movies, :n_comentarios, :integer
  	add_column :movies, :valoracion, :float
  	add_column :movies, :video_url, :string
  end
end