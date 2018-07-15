Rails.application.routes.draw do
  devise_for :admins, controllers: {sessions: "admin/sessions"}

  scope module: :admin, path: :admins, as: :admins do
    root to: "homes#index", as: :admin_root
    resources :admins
  end

  devise_for :users, controllers: {sessions: "user/sessions"}

  scope module: :user do
    root to: "homes#index"
  end
end
