Rails.application.routes.draw do
    
    
    devise_for :users
    devise_scope :user do  
        get '/users/sign_out' => 'devise/sessions#destroy'     
    end
    
    #delete "/users/sign_out", to:"devise/sessions#destroy"
    #root "books#index"
    root to:"dashboards#index"
    get "/books/seehome", to:"books#seehome"
    get "/search", to: "books#search"

    
    resources :books
end
