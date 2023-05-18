# frozen_string_literal: true

class Hystory < ApplicationRecord
  belongs_to :person

  delegate :name, to: :person, prefix: :user
  delegate :nickname, to: :person, prefix: :user
end
