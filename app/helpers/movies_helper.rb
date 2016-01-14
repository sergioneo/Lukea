module MoviesHelper	
  def listar_por_valoracion(valoracion_ordenada)
    peliculas_ordenadas = []
    valoracion_ordenada.each_with_index do |valorado,i|
      peliculas_ordenadas[i] = valorado.cacheable
    end
    return peliculas_ordenadas
  end
end
