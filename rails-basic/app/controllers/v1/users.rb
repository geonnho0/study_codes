class V1::Users < Grape::API
  resource :users do
    desc "Returns list of users"
    get do
      User.all
    end

    desc "Returns a specific user"
    params do
      requires :id, type: Integer, desc: "User ID"
    end
    route_param :id do
      get do
        user = User.find(params[:id])
        user
      end
    end

    desc "Creates a new user"
    params do
      requires :name, type: String, desc: "User name"
    end
    post do
      user = User.create!(name: params[:name])
      user.id
    end
  end
end
