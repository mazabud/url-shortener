Rails.application.routes.draw do
  root "shorts#index"
  get "/shorts", to: "shorts#index"
  get "/:slug", to: "shorts#show"
  get "/:slug/stat", to: "shorts#stat"
  

  resources :shorts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
