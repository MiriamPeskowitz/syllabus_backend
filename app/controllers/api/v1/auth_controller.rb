class Api::V1::AuthController < ApplicationController
	skip_before_action :authorized, only: [:create]
	
	# find user by email, using user login params (not user params from the DB) 
	def create
		@user = User.find_by(email: user_login_params[:email])
		if @user && @user.authenticate(user_login_params)[:password]
			# db has password_digest, will compare that, through bcrypt, with ulp password
			token = encode_token( {user_id: @user.id} )
			# similar to how we used to give someone a session or cookie
			# we create it here and send it to the front end 
			render json: { user: UserSerializer.new(@user), jwt: token}, status: :created
		else 
			render json: {message: "invalid email or password" }, status: :unauthorized
		end 
	end

	private
	def user_login_params
		params.require(:user).permit(:email, :password)
	end
end
