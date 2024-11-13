RSpec.describe Post, type: :model do
  it 'creates a post with a user' do
    post = create(:post)
    pp post
    expect(post.user).to be_present
  end
end
