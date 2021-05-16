Rails.application.routes.draw do
  root 'labs#index'
  resources :labs do
    resources :marks
  end
end
