# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hystory, type: :model do
  describe 'associations' do
    it { is_expected.to respond_to :person_id }
    it { is_expected.to belong_to :person }
  end
end
