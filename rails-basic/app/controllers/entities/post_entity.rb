class Entities::PostEntity < Grape::Entity
  expose :title, documentation: { type: "String" }
  expose :user, using: Entities::UserEntity
  expose :name, as: :author_name

  delegate :user, to: :object
  delegate :name, to: :user
end
