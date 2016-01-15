class Movie < ActiveRecord::Base
	has_many :categories, :through => :category_movies
	has_many :category_movies
	has_many :comments, :dependent => :delete_all
	
	ratyrate_rateable "Valoración"
	mount_uploader :image, MoviePhotoUploader
	validate :image_size

	accepts_nested_attributes_for :category_movies
	accepts_nested_attributes_for :comments

	validates :titulo, presence: true, length: { minimum: 1 }
	
	#Buscador de películas
	
	def self.search(search)
		if search 
			where('lower(titulo) LIKE ?', "%#{search.downcase}%")
		else
			scoped
		end
	end
	
	private
		
		def image_size
			if image.size > 10.megabytes
				errors.add(:image, "Ingrese imagen menor a 5MB")
			end
		end
end
