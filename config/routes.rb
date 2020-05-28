Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  	namespace 'api' do
  		namespace 'v1' do
  			resources :interviews
  		end
  	end
  	
  	resources :interviews do
	  resources :participants
	end
	root "interviews#index"
end
