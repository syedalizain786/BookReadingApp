Rails.application.routes.draw do

    #root "books#index"
    root to:"books#dashboard"
    resources :books
end
