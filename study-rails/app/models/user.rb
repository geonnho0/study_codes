class User < ApplicationRecord
  has_many :received_feedbacks, class_name: "Feedback", foreign_key: "receiver_id", dependent: :destroy
  has_many :sent_feedbacks, class_name: "Feedback", foreign_key: "sender_id", dependent: :destroy
  has_many :posts, dependent: :destroy
end
