require 'sidekiq/web'

Rails.application.routes.draw do
  mount ApplicationApi => "/"
  mount Sidekiq::Web => "/sidekiq"
end
