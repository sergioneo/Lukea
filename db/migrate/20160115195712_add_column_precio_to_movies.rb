class AddColumnPrecioToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :precio, :integer
    remove_column :movies, :ano
    add_column :movies, :ano, :integer
  end
end
