class ApplicationController < ActionController::API
	before_action :authorized
	# This locks down the entire app, by demanding only authorized 
	# users; will change this for those entering the sign up page. 

# first encode
	def encode_token(payload)
		JWT.encode(payload, secret@@@)
	end 

	def auth_header
		request.headers['Authorization']
	end 

#then decode it on the front end for the user 
	def decode_token
		if auth_header
			token= auth_header.split(' ')[1]
			begin
				JWT.decode(token, secret@@@, true, jwtalgorithm 'HS256')
			rescue JWT::DecodeError
				nil
			end
		end
	end

	def current_user
		if decode_token
			user_id = decode_token[0]['user_id']
			@user = User.find_by(id: user_id)
		end 
	end 

	def logged_in?
		!!current_user
	end 

	def authorized
		render json: {message: 'Please log in'}, status: :unauthorized unless logged_in?
	end
end
 # HS256