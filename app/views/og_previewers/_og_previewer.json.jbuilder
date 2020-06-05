# frozen_string_literal: true

json.extract! og_previewer, :id, :input_url, :og_image_url, :job_id, :status, :created_at, :updated_at
json.url og_previewer_url(og_previewer, format: :json)
