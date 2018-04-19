Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get '/' => 'base#index'
    end
  end

  get '*path' => 'dashboard#index'
end
