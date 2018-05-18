class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :plants
  has_many :api_keys

  validates :name, presence: true
  validates :email, presence: true

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.info.name
      new_user.email              = auth_info.info.email
      new_user.image              = auth_info.info.image
      new_user.oauth_token        = auth_info.credentials.token
    end
  end
end
