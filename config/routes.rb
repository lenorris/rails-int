Library::Application.routes.draw do
  
  resources :users
  resource :session
  
  resources :books do
    collection do
      get :search
    end
    resources :reservations, only: [:create, :new] do
      member do
        put :free
      end
    end
  end
  
  root :to => 'books#index'

end
