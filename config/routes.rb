Rails.application.routes.draw do
# 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :public do
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"

  get "customers/my_page" => "customers#show", as: "my_page"
  get "customers/information/edit" => "customers#edit", as: "information/edit"
  patch "customers/information" => "customers#update", as: "information"
  get "customers/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
  patch "customers" => "customers#withdraw", as: "withdraw"
  patch "orders/check" => "orders#check", as: "check"
  get   "orders/done"  => "orders#done",  as: "done"
  resources :orders, only: [:new, :index, :show, :create]
  resources :order_addresses, only: [:create, :index, :edit, :update, :destroy]
  resources :items, only: [:index, :show]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, only: [:create, :index, :update, :destroy]
  


  patch "orders/check" => "orders#check", as: "check"
  get   "orders/done"  => "orders#done",  as: "done"
  resources :orders, only: [:new, :index, :show, :create]

end

namespace :admin do
  root to: "homes#top"
  resources :genres, only: [:index, :create, :edit, :update, :destroy]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :items, only: [:new, :create, :show, :edit, :index, :update]

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end