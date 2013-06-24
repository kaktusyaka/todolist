Myapp::Application.routes.draw do
  devise_for :users

  resources :projects, except: [:edit, :show, :new] do
    resources :tasks, except: [:new, :show] do
      post :sort, on: :collection
    end
  end

  root :to => 'projects#index'
end
