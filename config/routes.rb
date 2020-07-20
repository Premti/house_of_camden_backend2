Rails.application.routes.draw do

  post "/admin", to: "admins#sign_in"
  get "/validates", to: "admins#validate"
end