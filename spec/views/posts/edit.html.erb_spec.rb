# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/edit', type: :view do
  let(:person) { Person.create!(name: 'Kraft') }
  let(:post) do
    Post.create!(
      title: 'MyString',
      person:,
      body: 'MyText'
    )
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
