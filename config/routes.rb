Rails.application.routes.draw do

  match "/file/:id", :to => "simple_uploader/attachments#show"

  namespace :simple_uploader do
    resources :attachments, :only => [:create, :destroy]
  end
end