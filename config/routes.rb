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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
namespace :admins do
  
  resources :items, only: [:new, :create, :show, :edit, :index, :update]
  # 商品関連
end 
end
