# frozen_string_literal: true

class HystoryLogger
  def initialize(type, person_id)
    @type = type
    @user_id = person_id
  end

  def call
    Hystory.create!(
      operation_type: @type,
      person_id: @user_id
    )
  end
end
