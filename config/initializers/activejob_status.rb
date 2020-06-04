# frozen_string_literal: true

# Set a store for our status of ActiveJob jobs
ActiveJob::Status.store = ActiveSupport::Cache::MemoryStore.new
