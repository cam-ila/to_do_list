Rails.application.routes.draw do
  #root to: 'lists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 # get '/:url', to: 'lists#show', id: "lists#show"
  
 
  root 'lists#new'
  get '/:id', to: 'lists#show'
  resources :lists do
	  resources :simple_tasks
	  resources :long_tasks
	  resources :temporary_tasks
  end


 
end
