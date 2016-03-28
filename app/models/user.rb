class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
         
  has_many :comments

  def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.nombre = auth.info.name
      user.foto_url = auth.info.image
      user.password = Devise.friendly_token[0,20]
    end
  end
  
  def country_name
    country = ISO3166::Country[pais]
    country.translations[I18n.locale.to_s] || country.name
  end

  ratyrate_rater
  validates :saldo, :numericality => { :greater_than_or_equal_to => 0 }
  validates :email, presence: true
  validates :encrypted_password, presence: true
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/unknown.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
end
