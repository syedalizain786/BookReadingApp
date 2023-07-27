Rails.application.routes.draw do
    
    
  #Roots for devise users
    devise_for :users
    devise_scope :user do  
        get '/users/sign_out' => 'devise/sessions#destroy'     
    end
    
    #root "books#index"

    root to:"dashboards#index"
    get "/books/seehome", to:"books#seehome"
    get "/search", to: "books#search"
    
    #Roots for job

    #For launching a job go to localhost:3000/welcome
    #root to: "welcome#index"
    get "/welcome", to:"welcome#index"

    get "welcome/index"

    # route where any visitor require the helloWorldJob to be triggered
    post "welcome/trigger_job"

    # where visitor are redirected once job has been called
    get "other/job_done", to:"others#job_done"

    


    
    resources :books
end
