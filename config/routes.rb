Spree::Core::Engine.routes.prepend do

  namespace :admin do
    resources :properties do
      collection do
        get :autocomplete
      end
    end
  end
  
end