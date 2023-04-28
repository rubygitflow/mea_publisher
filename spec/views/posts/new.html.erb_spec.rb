# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/new', type: :view do
  let(:person) { Person.create!(name: 'Kraft') }

  before do
    assign(:post, Post.new(
                    title: 'MyString',
                    person: person,
                    body: 'MyText'
                  ))
  end

  it 'renders new post form' do
    render

    assert_select 'form[action=?][method=?]', posts_path, 'post' do
      assert_select 'input[name=?]', 'post[title]'

      assert_select 'input[name=?]', 'post[person_id]'

      assert_select 'textarea[name=?]', 'post[body]'
    end
  end
end
