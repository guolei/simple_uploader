Rails.application.routes.draw do

  match "/verify_user", :to => "eco_apps_user_services#verify"

end