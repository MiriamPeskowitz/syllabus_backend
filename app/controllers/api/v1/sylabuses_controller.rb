class Api::V1::SylabusesController < ApplicationController

	def index
		sylabuses = Sylabus.all
		# render json: sylabuses
		# options = {
		# 	include: [:category]
		# 	# 	include: [:category, :users]
		# }
		# render json: SylabusSerializer.new(sylabuses, options)
		render json: SylabusSerializer.new(sylabuses)
	end

	def create
		sylabus = Sylabus.new(sylabus_params)
		if sylabus.save 
			render json: sylabus, status: :accepted 
		else
			render json: {errors: sylabus.errors.full_messages}, status: :unprocessable_entity
		end 
	end


private
	def sylabus_params
		params.require(:sylabus).permit(:title, :description, :image_url, :category_id)
	end

end
