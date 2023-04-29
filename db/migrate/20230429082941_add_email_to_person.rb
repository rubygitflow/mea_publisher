# frozen_string_literal: true

class AddEmailToPerson < ActiveRecord::Migration[7.1]
  def change
    add_column :people, :email, :string, null: false, default: Faker::Internet.email
  end
end
