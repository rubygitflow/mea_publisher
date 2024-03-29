# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_presence_of(:email) }
  end
end
