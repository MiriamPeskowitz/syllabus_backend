class User < ApplicationRecord
	has_secure_password

	has_many :sylabuses, dependent: :before_destroy 

	validates :email, uniqueness: { case_sensitive: false }
end
