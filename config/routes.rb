Rails.application.routes.draw do
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/landing'
  get 'pages/new_member_guide', as: 'new_member_guide'
  root 'pages#landing'

  resources :activities
  resource :my_page

  namespace :admin do
    root 'activities#index'

    resources :activities do
      post :approve, on: :member
    end
  end
end
