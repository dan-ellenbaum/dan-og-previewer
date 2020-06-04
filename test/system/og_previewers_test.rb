# frozen_string_literal: true

require 'application_system_test_case'

class OgPreviewersTest < ApplicationSystemTestCase
  setup do
    @og_previewer = og_previewers(:one)
  end

  test 'visiting the index' do
    visit og_previewers_url
    assert_selector 'h1', text: 'Og Previewers'
  end

  test 'creating a Og previewer' do
    visit og_previewers_url
    click_on 'New Og Previewer'

    fill_in 'Input url', with: @og_previewer.input_url
    fill_in 'Job', with: @og_previewer.job_id
    fill_in 'Og image url', with: @og_previewer.og_image_url
    fill_in 'Status', with: @og_previewer.status
    click_on 'Create Og previewer'

    assert_text 'Og previewer was successfully created'
    click_on 'Back'
  end

  test 'updating a Og previewer' do
    visit og_previewers_url
    click_on 'Edit', match: :first

    fill_in 'Input url', with: @og_previewer.input_url
    fill_in 'Job', with: @og_previewer.job_id
    fill_in 'Og image url', with: @og_previewer.og_image_url
    fill_in 'Status', with: @og_previewer.status
    click_on 'Update Og previewer'

    assert_text 'Og previewer was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Og previewer' do
    visit og_previewers_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Og previewer was successfully destroyed'
  end
end
