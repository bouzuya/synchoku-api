Rails.application.routes.draw do
  root 'status#index'

  resources :goals, only: [:index, :create, :show, :update, :destroy], shallow: true do
    resources :marks, only: [:index, :create, :show, :update, :destroy]
  end
end
