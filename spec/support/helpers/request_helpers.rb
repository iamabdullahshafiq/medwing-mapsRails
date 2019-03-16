# frozen_string_literal: true

module Helpers
  module RequestHelpers
    def request_headers(extra_headers = {})
      {
        'ACCEPT' => 'application/json'
      }.merge(extra_headers)
    end
  end
end
