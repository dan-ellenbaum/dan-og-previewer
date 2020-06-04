# frozen_string_literal: true

# Use opengraph parser gem to perform the task
# of scraping the og data from a 3rd part url
# given as an argument to this job
class FetchOgDataJob < ApplicationJob
  queue_as :default

  def perform(input_url)
    # TODO: Determine if we want to use fallback
    # method in case of no og data on this url
    # for now, use "false" here to turn it off
    og = OpenGraph.new(input_url, false)
    # TODO: Save this to DB so the polling code
    # can grab the image when it is populated
    og.images
  end
end
