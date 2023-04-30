# frozen_string_literal: true

class PostNotificationMailer < ApplicationMailer
  def create_notification(post, user)
    @post = post

    mail to: user.email
  end
end
