# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :person

  validates :body, presence: true,
                   length: { minimum: 1, maximum: 100.kilobytes },
                   allow_blank: false

  after_create :hystory_created
  after_update :hystory_updated
  after_destroy :hystory_destroyed

  attr_accessor :current_user

  delegate :name, to: :person, prefix: :author
  delegate :nickname, to: :person, prefix: :author

  private

  def hystory_created
    HystoryLogger.new('created', current_user.id).call
    PostNotificationJob.perform_later(self)
  end

  def hystory_updated
    HystoryLogger.new('updated', current_user.id).call
  end

  def hystory_destroyed
    HystoryLogger.new('deleted', current_user.id).call
  end
end
