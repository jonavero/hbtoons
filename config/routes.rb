Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  # Rutas para la cabecera de la series
  get '/inicio/admin' => 'series#inicio'

   root :to=> 'series#index', as: :inicio
  get '/serie/:id' =>'series#show', as: :serie
  get '/new/serie'=>'series#new'
  post '/new/serie'=>'series#create'
  get '/serie/:id/edit' => 'series#edit', as: :editSerie
  patch '/serie/:id/edit'=>'series#update',as: :updateSerie


  #Ruta para los Capitulos
  get '/serie/capitulo/:id' => 'capitulos#show', as: :capitulo
  get '/capitulo/new' => 'capitulos#new'
  post '/capitulo/new' => 'capitulos#create'
  get '/capitulo/edit/:id' =>'capitulos#edit',as: :editCapitulo
  patch '/capitulo/edit/:id'=> 'capitulos#update',as: :updateCapitulo


  #Ruta para los Usuario admin

   get '/users' => 'usuarios#index'
   get '/new/usuario' => 'usuarios#new'
   post '/new/usuario' => 'usuarios#create'
   get 'usuario/:id/edit' => 'usuarios#edit', as: :edit
   patch 'usuario/:id' => 'usuarios#update', as: :update

  #Rutas para manipular session
  # ***************************
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   delete '/logout' => 'sessions#destroy'

  #Rutas para los comentarios
  #
   post  '/new/cometario' => 'comentariocaps#create'

  #contacto
  get '/contacto' =>'series#contacto'

end
