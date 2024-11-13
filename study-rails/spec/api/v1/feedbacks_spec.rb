RSpec.describe V1::Feedbacks do
  let(:current_user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:headers) do
    {
      user: current_user.id
    }
  end

  describe "get #sent" do
    it "본인 유저가 보낸 피드백을 반환한다" do
      create(:feedback, sender: current_user)
      get '/api/v1/feedbacks/sent', headers: headers
      expect(response.status).to eq(200)
    end
  end

  describe "post" do
    it "새로운 피드백을 보낸다" do
      post '/api/v1/feedbacks', headers: headers, params: {
        content: "new feedback content",
        receiver_id: another_user.id
      }
      expect(response.status).to eq(201)
    end

    it "보내려는 피드백의 내용이 비어있으면 안된다" do
      post '/api/v1/feedbacks', headers: headers, params: {
        content: nil,
        receiver_id: another_user.id
      }
      expect(response.status).to eq(400)
    end

    it "존재하지 않은 유저에게 피드백을 보낼 수 없다" do
      post '/api/v1/feedbacks', headers: headers, params: {
        content: "new feedback content",
        receiver_id: 3
      }
      expect(response.status).to eq(404)
    end
  end
end
