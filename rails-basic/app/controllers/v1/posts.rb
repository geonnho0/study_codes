class V1::Posts < Grape::API
  resource :posts do
    desc "Returns list of posts"
    get do
      Post.all
    end

    desc "Returns a specific post"
    params do
      requires :id, type: Integer, desc: "Post ID"
    end
    route_param :id do
      get do
        post = Post.find(params[:id])

        present :data,
                post,
                with: Entities::PostEntity
      end
    end

    desc "Creates a new post"
    params do
      requires :title, type: String, desc: "Post title"
    end
    post do
      current_user = User.find(1)
      Post.create!(title: params[:title], user: current_user)
      "Success created"
    end
  end
end
