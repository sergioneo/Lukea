class Category < ActiveRecord::Base
	has_many :movies, :through => :category_movies 
	has_many :category_movies
	has_many :actuals
	
	validates :category, presence: true, length: { minimum: 1 }
end
