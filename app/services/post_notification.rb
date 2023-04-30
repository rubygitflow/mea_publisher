# frozen_string_literal: true

class PostNotification
  def self.send_created_notification(post)
    PostNotificationMailer.create_notification(post, post.person).deliver_later
  end
end
