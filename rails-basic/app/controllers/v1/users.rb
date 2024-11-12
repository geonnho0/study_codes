class V1::Users < Grape::API
  resource :users do
    desc "Returns list of users"
    get do
      [
        { id: 1, name: "User 1" },
        { id: 2, name: "User 2" }
      ]
    end

    desc "Returns a specific user"
    params do
      requires :id, type: Integer, desc: "User ID"
    end
    route_param :id do
      get do
        { id: params[:id], name: "User #{params[:id]}" }
      end
    end

    desc "Creates a new user"
    params do
      requires :name, type: String, desc: "User name"
    end
    post do
      { id: 3, name: params[:name] }
    end
  end
end
