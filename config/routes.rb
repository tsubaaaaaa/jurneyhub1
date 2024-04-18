Rails.application.routes.draw do

  devise_for :users

  resources :users
  get 'users/mymap', to: 'users#mymap', as: 'users_mymap'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #resources :Hokkaidos
  #root 'Hokkaidos#index'

  get 'hokkaidos/new' => 'hokkaidos#new'
  get 'hokkaidos/top' => 'hokkaidos#top',as: 'hokkaidos_top'
  get 'hokkaidos/search' => 'hokkaidos#search'
  get 'hokkaidos/mapindex' => 'hokkaidos#mapindex'
  get 'hokkaidos/index' => 'hokkaidos#index'
  post 'hokkaidos' => 'hokkaidos#create'
  get 'hokkaidos/:id' => 'hokkaidos#show',as: 'hokkaido'
  patch 'hokkaidos/:id' => 'hokkaidos#update'
  delete 'hokkaidos/:id' => 'hokkaidos#destroy'
  get 'hokkaidos/:id/edit' => 'hokkaidos#edit'#, as: 'edit_hokkaido'
  #post 'hokkaidos/new' => 'hokkaidos#new'
  #get 'hokkaidos/index' => 'hokkaidos#index'
  #resources :hokkaidos, only: [:index]
  root 'hokkaidos#top'
  get '/hokkaido/hashtag/:name', to: "hokkaidos#hashtag", as:'hokkaidos_hashtag'
  #get 'hokkaidos/index'
 # root to: 'hokkaidos#index'

 #ライク
  post "likes/:hokkaido_id/create" => "likes#create"
  post "likes/:hokkaido_id/destroy" => "likes#destroy"

  get 'hokkaidos/:hokkaido_id/likes' => 'likes#create'#追記
  get 'hokkaidos/:hokkaido_id/likes/:id' => 'likes#destroy'#追記
  resources :hokkaidos

  resources :hokkaidos do
    resources :likes, only: [:create, :destroy]

     #コメント機能
    resources :comments, only: [:create]
  end


  resources :tag1s do
    get 'hokkaidos', to: 'hokkaidos#search'
  end

end
