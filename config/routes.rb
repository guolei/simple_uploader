Rails.application.routes.draw do

  match "/file/:id", :to => "simple_uploader/attachments#show"

end