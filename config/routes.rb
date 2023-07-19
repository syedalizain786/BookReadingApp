Rails.application.routes.draw do
    
    devise_for :users

    #root "books#index"
    root to:"dashboards#index"
    resources :books
end
