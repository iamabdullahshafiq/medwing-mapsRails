# frozen_string_literal: true

module Helpers
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end
  end
end
