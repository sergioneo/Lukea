class Movie < ActiveRecord::Base
	has_many :categories, :through => :category_movies
	has_many :category_movies
	has_many :comments, :dependent => :delete_all

	accepts_nested_attributes_for :category_movies
	accepts_nested_attributes_for :comments

	validates :titulo, presence: true, length: { minimum: 1 }
end
