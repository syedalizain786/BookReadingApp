Rails.application.routes.draw do
    
    
    devise_for :users
    
    #delete "/users/sign_out", to:"devise/sessions#destroy"
    #root "books#index"
    root to:"dashboards#index"
    get "/books/seehome", to:"books#seehome"
    get "/search", to: "books#search"

    
    resources :books
end
