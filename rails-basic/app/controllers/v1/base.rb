class V1::Base < Grape::API
  version "v1", using: :path
  prefix :api
  mount V1::Users
  mount V1::Posts
end
