# frozen_string_literal: true

class OgPreviewer < ApplicationRecord
    validates :input_url, presence: true
end
