class V1::Posts < Grape::API
  helpers do
    def set_post
      @post = Post.find(params[:id])
    end
  end

  before do
    set_post if params[:id].present?
  end

  resource :posts do
    desc "Returns list of posts"
    get do
      Post.all
    end

    desc "Returns a specific post"
    params do
      requires :id, type: Integer, desc: "Post ID"
    end
    get ":id" do
      @post
    end

    desc "Creates a new post"
    params do
      requires :title, type: String, desc: "Post title"
    end
    post do
      new_post = Post.new(title: params[:title])
      new_post.user = current_user

      authorize new_post, :create?

      if new_post.save
        new_post.id
      else
        -1
      end
    end

    desc "Delete a post"
    params do
      requires :id, type: Integer, desc: "Post ID"
    end
    delete ":id" do
      authorize @post
      post.destroy
    end

    desc "Update a post"
    params do
      requires :id, type: Integer, desc: "Post ID"
      requires :title, type: String, desc: "Post title"
    end
    put ":id" do
      authorize @post, :update?
      if @post.update(title: params[:title])
        "update done"
      else
        "update failed"
      end
    end
  end
end
