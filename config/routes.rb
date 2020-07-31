Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			resources :sylabuses, only: [:index, :create]
			resources :categories, only: [:index]
			resources :users, only: [:index, :create]
			post "/login", to: "auth#create"
		end 
	end 
end
