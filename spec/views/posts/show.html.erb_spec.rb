# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  let(:person) do
    Person.create!(
      name: 'Kraft',
      nickname: Faker::Internet.unique.username(specifier: 8),
      email: Faker::Internet.email
    )
  end

  before do
    post = Post.new(
      title: 'Title',
      person: person,
      body: 'MyText'
    )
    post.current_user = person
    post.save
    assign(:post, post)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(person.nickname.to_s)
    expect(rendered).to match(/MyText/)
  end
end
