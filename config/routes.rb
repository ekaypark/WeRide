Rails.application.routes.draw do
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/landing'
  get 'pages/new_member_guide', as: 'new_member_guide'
  root 'pages#landing'

  get 'pages/render_time_on_dates', as: 'render_time_on_dates'

  resources :activities do
    resources :reservations
    delete :delete_image_attachment
  end

  resource :my_page do
    resource :schedule
  end

  namespace :admin do
    root 'activities#index'

    resources :activities do
      post :approve, on: :member
      # delete :delete_image_attachment
    end
  end
end
