class Actual < ActiveRecord::Base
  belongs_to :category

  mount_uploader :imagen_url, ActualPhotoUploader
	validate :image_size
  
  private
		
		def image_size
			if imagen_url.size > 10.megabytes
				errors.add(:image, "Ingrese imagen menor a 5MB")
			end
		end
end
