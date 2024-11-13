class V1::Feedbacks < Grape::API
  resource :feedbacks do
    desc "Returns list of sent feedbacks"
    get "sent" do
      Feedback.find_by(sender_id: current_user.id)
    end

    desc "Returns a specific feedback"
    params do
      requires :id, type: Integer, desc: "Feedback ID"
    end
    get ":id" do
      Feedback.find(params[:id])
    end

    desc "Creates a new feedback"
    params do
      requires :content, type: String, desc: "Feedback content"
      requires :receiver_id, type: Integer, desc: "Receiver Id"
    end
    post do
      sender = current_user
      receiver = User.find(params[:receiver_id]) # or send receiver_id to Service and let service query
      SendFeedbackService.call(sender: sender, receiver: receiver, content: params[:content])
    end

    desc "Delete a feedback"
    params do
      requires :id, type: Integer, desc: "Feedback ID"
    end
    delete ":id" do
      feedback = Feedback.find(params[:id])
      authorize feedback, :destroy?
      feedback.destroy
    end

    desc "Update a feedback"
    params do
      requires :id, type: Integer, desc: "Feedback ID"
      requires :content, type: String, desc: "Feedback content"
    end
    put ":id" do
      feedback = Feedback.find(params[:id])
      authorize feedback, :update?
      if feedback.update(content: params[:content])
        "update done"
      else
        "update failed"
      end
    end
  end
end
