Rails.application.routes.draw do
  root "shorts#index"
  get "/shorten", to: "shorts#index"
  post "/shorten", to: "shorts#create"
  get "/:shortcode", to: "shorts#show"
  get "/:shortcode/stat", to: "shorts#stat"
  delete "/:shortcode/delete", to: "shorts#destroy"
  

  resources :shorts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
