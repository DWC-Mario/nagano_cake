Rails.application.routes.draw do
  get 'cart_items/index'
  get 'orders/new'
  get 'orders/confirm'
  get 'orders/complete'
  get 'orders/index'
  get 'orders/show'
devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
