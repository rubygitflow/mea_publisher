# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/index', type: :view do
  let(:person) do
    Person.create!(
      name: 'Kraft',
      email: Faker::Internet.email
    )
  end

  before do
    post1 = Post.new(
      title: 'Title',
      person: person,
      body: 'MyText'
    )
    post1.current_user = person
    post1.save
    post2 = Post.new(
      title: 'Title',
      person: person,
      body: 'MyText'
    )
    post2.current_user = person
    post2.save
    assign(:posts, [
             post1,
             post2
           ])
  end

  it 'renders a list of posts' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(person.name), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
  end
end
