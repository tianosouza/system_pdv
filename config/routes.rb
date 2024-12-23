Rails.application.routes.draw do
  resources :users do
    collection do
      post :sign_in
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
