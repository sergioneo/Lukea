class Movie < ActiveRecord::Base
	has_many :categories, :through => :category_movies
	has_many :category_movies
	has_many :commentaries

	accepts_nested_attributes_for :category_movies
end
