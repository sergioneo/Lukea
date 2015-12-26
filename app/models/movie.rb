class Movie < ActiveRecord::Base
	has_many :categories, :through => :category_movies
	has_many :category_movies
	has_many :commentaries
end
