Rails.application.routes.draw do
    
    
    devise_for :users

    #root "books#index"
    get "/search", to: "books#search"
    root to:"dashboards#index"
    get "/books/seehome", to:"books#seehome"
    
    resources :books
end
