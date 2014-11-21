class User < ActiveRecord::Base

  validates :email,    presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  has_many :twtickers

end
