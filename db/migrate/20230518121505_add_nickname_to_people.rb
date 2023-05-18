class AddNicknameToPeople < ActiveRecord::Migration[7.1]
  def up
    return if column_exists?(:people, :nickname, :string)

    change_table :people do |t|
      t.string :nickname, null: false, default: Faker::Internet.unique.username(specifier: 8)
    end
    Person.find_each do |elem|
      elem.update(nickname: Faker::Internet.unique.username(specifier: 8))
    end

    add_index :people, :nickname, unique: true
  end

  def down
    return unless column_exists?(:people, :nickname, :string)

    remove_index(:people, :nickname, unique: true) if index_exists?(:people, :nickname, unique: true)

    change_table :people do |t|
      t.remove :nickname
    end
  end
end
