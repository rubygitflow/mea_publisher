# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/index', type: :view do
  let(:person) { Person.create!(name: 'Kraft') }

  before do
    assign(:posts, [
             Post.create!(
               title: 'Title',
               person:,
               body: 'MyText'
             ),
             Post.create!(
               title: 'Title',
               person:,
               body: 'MyText'
             )
           ])
  end

  it 'renders a list of posts' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(person.id.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
  end
end
