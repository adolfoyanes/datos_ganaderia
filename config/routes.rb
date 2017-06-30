Rails.application.routes.draw do
  resources :reproduccions do
    collection {post :import}
  end
  resources :pesajes do
    collection {post :import}
  end
  resources :vacas do
    collection {post :import}
  end
  root 'pesajes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
