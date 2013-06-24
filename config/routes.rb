Myapp::Application.routes.draw do
  devise_for :users

  resources :projects do
    resources :tasks do
      post :sort, on: :collection
    end
  end

  root :to => 'projects#index'
end
