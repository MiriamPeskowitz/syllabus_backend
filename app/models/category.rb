class Category < ApplicationRecord
	has_many :sylabuses, dependent: :destroy
end
