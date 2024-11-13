require 'rails_helper'

RSpec.describe CreateUserJob, type: :job do
  it "performs the job" do
    Sidekiq::Testing.inline! do
      CreateUserJob.perform_async('name')
    end
    # Sidekiq::Worker.drain_all

    expect(User.count).to eq(1)
  end
end
