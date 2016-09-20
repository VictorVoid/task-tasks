class User < ActiveRecord::Base
	attr_accessor :password_confirmation

  validates_presence_of :name, :email, :password
  validates_uniqueness_of :login, :email
  validates_confirmation_of :password #cria dinamicamente um password_confirmation
  validates_format_of :email, with: /\A[a-z0-9.]+(\+[a-z0-9_-]+)?@[a-z0-9.-]+\.[a-z]{2,4}\z/
  # validates :name, presence: true
end
