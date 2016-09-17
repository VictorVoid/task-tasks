class User < ActiveRecord::Base
	attr_accessor :password_confirmation

  validates_presence_of :name, :email
  validates_format_of :email, with: /\A[a-z0-9.]+@[a-z0-9.-]+\.[a-z]{2,4}\z/
  # validates :name, presence: true

end
 
