class Sylabus < ApplicationRecord
	belongs_to :category
	belongs_to :user

	has_many :concentrations, dependent: :destroy
	# Don't need this: has_many :concentration_keywords, through: :concentrations
	has_many :keywords, through: :concentrations

	# has_many :concentration_keywords, through: :concentrations
 #  has_many :keywords, through: :concentration_keywords

	validates :title, presence: true
end
