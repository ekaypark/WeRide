Rails.application.routes.draw do
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'activities#index'

  # get 'pages/landing'
  # get 'pages/render_time_on_dates', as: 'render_time_on_dates'
  # get 'pages/new_member_guide', as: 'new_member_guide'

  resources :activities, only: [:index, :show] do
    resources :reservations
    get 'render_time_on_dates', on: :member
  end

  namespace :my_page do
    resources :reservations do
      post :cancel_request, on: :member
    end
  end

  namespace :host do
    resources :activities do
      delete :delete_image_attachment
    end
    resource :schedule
    resources :payout_infos do
      post :make_default, on: :member
    end
    resources :invoices
  end

  namespace :admin do
    root 'activities#index'
    resource :schedule
    resources :activities do
      post :approve, on: :member
      delete :delete_image_attachment
    end
    resources :reservations do
      post :update_status, on: :member
    end
    resources :invoices do
      post :complete_payout, on: :member
    end
  end
end
