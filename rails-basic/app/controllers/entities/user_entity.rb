class Entities::UserEntity < Grape::Entity
  expose :id, documentation: { type: Integer, desc: "사용자 ID" }
  expose :name, documentation: { type: "String" }
end
