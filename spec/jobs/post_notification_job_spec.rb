# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostNotificationJob, type: :job do
  let(:person) do
    Person.create!(
      name: 'Kraft',
      nickname: Faker::Internet.unique.username(specifier: 8),
      email: Faker::Internet.email,
      password: '12345678'
    )
  end
  let(:post) do
    post = Post.new(
      title: 'MyString',
      person:,
      body: 'MyText'
    )
    post.current_user = person
    post.save
    post
  end

  it 'calls Post Notification' do
    expect(PostNotification).to receive(:send_created_notification).with(post)
    described_class.perform_now(post)
  end
end
