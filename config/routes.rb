Rails.application.routes.draw do
	root 'lists#new'
	get '/lists', to: redirect('/')
	get '/:id', to: 'lists#show'
	get '/lists/:id', to: redirect('/%{id}')
  	resources :lists do
	  resources :simple_tasks
	  resources :long_tasks
	  resources :temporary_tasks
	end 
end
