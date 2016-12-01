Rails.application.routes.draw do
	resources :lists
  #root to: 'lists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'lists#new'
  # get '/:url', to: 'lists#show'

  resources :lists
  resources :simple_tasks
  resources :long_tasks
  resources :temporary_tasks
end
