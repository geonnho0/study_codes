class CreateUserJob
  include Sidekiq::Job

  def perform(name)
    User.create!(name: name)
  end
end
