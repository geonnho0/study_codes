class ApplicationApi < Grape::API
  format :json

  mount V1::Base
end
