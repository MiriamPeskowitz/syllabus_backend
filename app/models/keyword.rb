class Keyword < ApplicationRecord
	has_many :concentration_keywords
	has_many :concentrations, through: :concentration_keywords
	has_many :sylabuses, through: :concentrations
end

