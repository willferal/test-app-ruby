# frozen_string_literal: true

module Turbo
  module SafeRedirection
    extend ActiveSupport::Concern

    def redirect_to(url = {}, options = {})
      result = super

      if !request.get? && options[:turbo] != false && request.accepts.include?(Mime[:turbo_stream])
        self.status = 303
      end

      result
    end
  end
end