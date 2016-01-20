class CategoryMovie < ActiveRecord::Base
	belongs_to :movie
	belongs_to :category
	
	validates :category_id, presence: true
	
end
