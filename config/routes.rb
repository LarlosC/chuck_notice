Rails.application.routes.draw do
  root 'chuck#home'

  post '/notice' => 'chuck#notice'

  get 'fail' => 'chuck#fail'
end
