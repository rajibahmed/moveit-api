Rails.application.routes.draw do
  resources :offers, only: [:show, :create]

	get "/health-check" => "welcome#health"
	get 'distance' => 'distance#index'
end
