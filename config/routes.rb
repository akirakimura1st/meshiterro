Rails.application.routes.draw do
	devise_for :users
	root 'post_images#index'

	resources :post_images, only: [:new, :create, :index, :show, :destroy] do
		resource :favorites, only: [:create, :destroy]
		resource :post_comments, only: [:create, :destroy]
	end

	resources :users, only: [:show, :edit, :update]

	Kaminari.configure do |config|
		config.default_per_page = 5
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
