Rails.application.routes.draw do
  namespace :authentication, path: '', as: ''  do
    resources :users, only: [:new, :create], path: '/sign_up', path_names: { new: '/' }
    resources :sessions, only: [:new, :create, :destroy], path: '/login', path_names: { new: '/' }
  end

  resources :contacts, only: [:new, :create]
  resources :administrations, only: :index
  resources :homes, only: :index, path: '/'
  resources :favorites, only: [:index, :create, :destroy], param: :product_id
  resources :users, only: :show, path: '/user', param: :username
  resources :categories, except: :show
  resources :products do
    member do
      delete :delete_image_attachment
    end
  end
end
