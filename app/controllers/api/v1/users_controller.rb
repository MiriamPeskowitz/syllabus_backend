class Api::V1::UsersController < ApplicationController
	skip_before_action :authorized, only: [:create, :index]

	def index
		users = User.all 
		render json: {user: UserSerializer.new(users) }, status: 200
	end

	def create
		@user = User.create(user_params)
			binding.pry
		if @user.valid?
			@token = encode_token(user_id: @user.id)
			render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
		else 
			render json: {error: 'failed to create new user'}, status: :not_acceptable
		end 
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :bio, :image_url)
	end
end
