Rails.application.routes.draw do
  
  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
        patch :incomplete
      end
    end
  end

  devise_for :users
  resources :posts do
    resources :comments
  end 
  resources :confirmations

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index' , as: 'home'

  get 'about' => 'pages#about' , as: 'about'
  get 'contact' => 'pages#contact' , as: 'contact'
  get 'section1' => 'pages#section1' , as: 'section1'
  get 'section2' => 'pages#section2' , as: 'section2'
  get 'section3' => 'pages#section3' , as: 'section3'
  get 'section4' => 'pages#section4' , as: 'section4'
  
end
