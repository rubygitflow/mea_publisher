# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  let(:person) { Person.create!(name: 'Kraft') }

  before do
    assign(:post, Post.create!(
                    title: 'Title',
                    person:,
                    body: 'MyText'
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(person.id.to_s)
    expect(rendered).to match(/MyText/)
  end
end
