Rails.application.routes.draw do
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'activities#index'

  # get 'pages/landing'
  # get 'pages/render_time_on_dates', as: 'render_time_on_dates'
  get 'pages/new_member_guide', as: 'new_member_guide'

  resources :activities, only: [:index, :show] do
    resources :reservations
    get 'render_time_on_dates', on: :member
  end

  resource :my_page, only: :show
  namespace :my_page do
    resources :reservations
  end

  resource :host, only: :show
  namespace :host do
    resources :activities do
      delete :delete_image_attachment
    end
    resource :schedule
  end

  namespace :admin do
    root 'activities#index'
    resources :activities do
      post :approve, on: :member
      delete :delete_image_attachment
    end
  end
end
