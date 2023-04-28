# frozen_string_literal: true

class CreateHystories < ActiveRecord::Migration[7.0]
  def change
    create_table :hystories do |t|
      t.string :operation_type
      t.references :person, null: false, foreign_key: true
      t.datetime :created_at, precision: 6, null: false
    end
  end
end
