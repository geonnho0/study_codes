RSpec.describe Post, type: :model do
  it 'creates a post with a user' do
    post = create(:post)
    expect(post.user).to be_present
  end
end
