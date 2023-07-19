class ChangeBodyInPosts < ActiveRecord::Migration[7.1]
  def up
    change_column(:posts, :body, :text, limit: 100.kilobytes)
    change_column_null(:posts, :body, false)
  end

  def down
    change_column_null(:posts, :body, true)
    change_column(:posts, :body, :text, limit: nil)
  end
end
