# frozen_string_literal: true

# Use opengraph parser gem to perform the task
# of scraping the og data from a 3rd part url
# given as an argument to this job
#
# ActiveJob::Status is put in here in order to
# be able to get more information out of jobs in the
# queue (not used much now but very useful in the future and
# for debugging)
#
# TODO: Determine if we want to use fallback
# method in OpenGraph in case of no og data on this url
# for now, use "false" arg to turn it off
class FetchOgDataJob < ApplicationJob
  include ActiveJob::Status
  queue_as :og_fetches

  def perform(og_preview_rec)
    og_preview_rec.update(job_id: job_id, status: status)
    og = OpenGraph.new(og_preview_rec.input_url, false)
    og_preview_rec.update(
      og_image_url: og&.images&.first,
      status: 'completed'
    )
  end
end
