class UsersController < ApplicationController
  skip_forgery_protection only: [:create]

  def index
    ActiveRecord::Base.connected_to(role: :reading) do
      @users = User.all
    end
  end

  def create
    ActiveRecord::Base.connected_to(role: :writing) do
      User.create!(name: params[:name])
    end
  end
end
