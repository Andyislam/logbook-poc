Rails.application.routes.draw do
  	devise_for :users

	get '/dashboard/index' => 'dashboard#index'
	
	resources :log_events
  	
  	root 'welcome#index'
  	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
