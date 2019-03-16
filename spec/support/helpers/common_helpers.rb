# frozen_string_literal: true

module Helpers
  module CommonHelpers
    def expect_error(error)
      expect(json['errors']['messages'].include?(error)).to be_truthy
    end
  end
end
