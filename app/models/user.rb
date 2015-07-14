class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_secure_password

  validates_uniqueness_of :name, :email
  validates_presence_of :name, :email
  validates_presence_of :password, on: :create
end
