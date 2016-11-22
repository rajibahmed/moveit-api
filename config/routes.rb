Rails.application.routes.draw do
  resources :offers, only: [:show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get "/health-check" => "welcome#health"

	get 'distance' => 'distance#index'
end
