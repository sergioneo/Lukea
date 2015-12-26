class Category < ActiveRecord::Base
	has_many :movies, :through => :category_movies 
	has_many :category_movies
end
