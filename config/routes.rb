Rails.application.routes.draw do

  resources :admins

  post "/admin", to: "admins#sign_in"
  get "/validates", to: "admins#validate"
  post "/bookings", to: "bookings#create"
  post "/sign_up", to: "admins#create"
  get "/check_all_bookings", to: "bookings#index"
  patch "/confirm_bookings/:id", to: "bookings#confirm_bookings"
  patch "/reject_bookings/:id", to: "bookings#reject_bookings"
end