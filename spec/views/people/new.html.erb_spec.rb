# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'people/new', type: :view do
  before do
    assign(:person, Person.new(
                      name: 'Nick',
                      nickname: 'Nick_1234',
                      email: 'sa@post.com'
                    ))
  end

  it 'renders new person form' do
    render

    assert_select 'form[action=?][method=?]', people_path, 'post' do
      assert_select 'input[name=?]', 'person[name]'

      assert_select 'input[name=?]', 'person[nickname]'

      assert_select 'input[name=?]', 'person[email]'
    end
  end
end
