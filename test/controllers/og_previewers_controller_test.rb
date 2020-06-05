# frozen_string_literal: true

require 'test_helper'

class OgPreviewersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @og_previewer = og_previewers(:one)
  end

  test 'should get index' do
    get og_previewers_url
    assert_response :success
  end

  test 'should get new' do
    get new_og_previewer_url
    assert_response :success
  end

  test 'should create og_previewer' do
    assert_difference('OgPreviewer.count') do
      post og_previewers_url, params: { og_previewer: { input_url: @og_previewer.input_url, job_id: @og_previewer.job_id, og_image_url: @og_previewer.og_image_url, status: @og_previewer.status } }
    end

    assert_redirected_to og_previewer_url(OgPreviewer.last)
  end

  test 'should show og_previewer' do
    get og_previewer_url(@og_previewer)
    assert_response :success
  end

  test 'should destroy og_previewer' do
    assert_difference('OgPreviewer.count', -1) do
      delete og_previewer_url(@og_previewer)
    end

    assert_redirected_to og_previewers_url
  end
end
