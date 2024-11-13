class SendFeedbackService < ApplicationService
  def initialize(sender:, receiver:, content:)
    @sender = sender
    @receiver = receiver
    @content = content
  end

  def call
    Feedback.create!(sender: @sender, receiver: @receiver, content: @content)
  end
end
