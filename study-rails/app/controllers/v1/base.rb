class V1::Base < Grape::API
  version "v1", using: :path
  format :json
  prefix :api

  include ::GrapeBase

  mount V1::Users
  mount V1::Posts
  mount V1::Feedbacks
end
