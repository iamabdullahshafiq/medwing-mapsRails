# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Location, type: :model do
  context '#create' do
    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:latitude) }

    it { should validate_length_of(:title).is_at_most(100) }
    it { should validate_numericality_of(:longitude) }
    it { should validate_numericality_of(:latitude) }
  end
end
