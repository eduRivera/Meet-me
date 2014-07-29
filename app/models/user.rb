class User < ActiveRecord::Base
	
	has_many :visits

	validates :name, presence: true, length: { minimum: 3 }
	validates :email, presence: true, length: { minimum: 3 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :pwd, presence: true, length: { minimum: 3 }

end
