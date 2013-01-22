OurData::Application.routes.draw do
  resources :datasets, :only => [:index, :show]
  resources :agencies, :only => [:index, :show]
  resources :tags, :only => [:index, :show]
  resources :formats, :only => [:index, :show]
end
