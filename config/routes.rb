OnLife::Application.routes.draw do
  resources :uploads

  post "uploads/:id" => 'uploads#reshow#id'

end
