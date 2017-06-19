Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  shallow do
    resources :policies do
      resources :insured_items
    end
  end
end
