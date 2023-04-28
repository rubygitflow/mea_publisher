# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.references :person, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
