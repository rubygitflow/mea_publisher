# frozen_string_literal: true

class PostNotificationJob < ApplicationJob
  queue_as :send_email

  def perform(post)
    PostNotification.send_created_notification(post)
  end
end
