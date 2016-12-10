Rails.application.routes.draw do
	root 'lists#new'
	get '/:id', to: 'lists#show'
  	resources :lists do
	  resources :simple_tasks
	  resources :long_tasks
	  resources :temporary_tasks
	end 
end
