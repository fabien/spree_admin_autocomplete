Rails.application.routes.draw do

  namespace :admin do
    resources :properties do
      collection do
        get :autocomplete
      end
    end
  end
  
end