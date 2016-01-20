class Multimedium < ActiveRecord::Base
  mount_uploader :imagen, MultimediaPhotoUploader
	validate :image_size
	validates :video_url, presence: true
	validates :titulo, presence: true
	
	private
		
	def image_size
		if imagen.size > 10.megabytes
			errors.add(:image, "Ingrese imagen menor a 5MB")
		end
	end
end
