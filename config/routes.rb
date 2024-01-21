Rails.application.routes.draw do

  devise_for :users,skip: [:passwords],controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }
  devise_for :admins,skip: [:registrations,:passwords],controllers: {
    sessions: "admin/sessions"
  }

  scope module: :user do
    get root to: "recipes#index"
    resources :users, only: [:index,:show,:edit,:update]
    resources :recipes do
      resource :favorites,only: [:create,:destroy]
    end
    get 'daily_recipes'=>"recipes#daily_recipes",as: "daily_recipes"
    get 'search'=>'recipes#searches',as: 'search'
    resources :events,only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
