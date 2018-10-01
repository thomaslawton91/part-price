Rails.application.routes.draw do
  root to: 'rules#index'
  resources :rules, only: [:index, :new, :create] do
    collection { post :import }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
