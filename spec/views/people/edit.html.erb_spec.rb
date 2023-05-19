# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/edit', type: :view do
  let(:person) do
    Person.create!(
      name: 'Kraft',
      nickname: Faker::Internet.unique.username(specifier: 8),
      email: Faker::Internet.email
    )
  end
  let(:post) do
    post = Post.new(
      title: 'MyString',
      person: person,
      body: 'MyText'
    )
    post.current_user = person
    post.save
    post
  end

  before do
    assign(:post, post)
  end

  it 'renders the edit post form' do
    render

    assert_select 'form[action=?][method=?]', post_path(post), 'post' do
      assert_select 'input[name=?]', 'post[title]'

      assert_select 'input[name=?]', 'post[person_id]'

      assert_select 'textarea[name=?]', 'post[body]'
    end
  end
end
