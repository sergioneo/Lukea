class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  
  validates :user_id, presence: true
  validates :contenido, presence: true, length: { minimum: 1 }
  validates :movie_id, presence: true
end
