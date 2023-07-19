# frozen_string_literal: true

class Person < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :nickname, presence: true, uniqueness: true

  def with_rand_nick
    self.nickname = Faker::Internet.unique.username(specifier: 8)
    self
  end

  def with_rand_email
    self.email = Faker::Internet.unique.email
    self
  end
end
