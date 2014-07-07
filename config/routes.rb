Flix::Application.routes.draw do

  root "accueil#index"
  get     "page01"      =>     "page01#index"
  resources :movies do
    resources :reviews
      end
end
