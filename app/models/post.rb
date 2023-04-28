# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :person

  after_create :hystory_created
  after_update :hystory_updated
  after_destroy :hystory_destroyed

  private

  def hystory_created
    HystoryLogger.new('created', person_id).call
  end

  def hystory_updated
    HystoryLogger.new('updated', person_id).call
  end

  def hystory_destroyed
    HystoryLogger.new('deleted', person_id).call
  end
end
