# frozen_string_literal: true

class OgPreviewer < ApplicationRecord
  validates :input_url, presence: true, format: URI.regexp(%w[http https])
end
