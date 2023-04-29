# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :person

  after_create :hystory_created
  after_update :hystory_updated
  after_destroy :hystory_destroyed

  attr_accessor :current_user

  delegate :name, to: :person, prefix: :author

  private

  def hystory_created
    HystoryLogger.new('created', current_user.id).call
  end

  def hystory_updated
    HystoryLogger.new('updated', current_user.id).call
  end

  def hystory_destroyed
    HystoryLogger.new('deleted', current_user.id).call
  end
end
