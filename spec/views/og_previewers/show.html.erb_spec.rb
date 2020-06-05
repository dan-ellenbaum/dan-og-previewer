# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'og_previewers/show', type: :view do
  before(:each) do
    @og_previewer = assign(
      :og_previewer, OgPreviewer.create!(
                       input_url: 'Input Url',
                       og_image_url: 'Og Image Url',
                       job_id: 'Job',
                       status: 'Status'
                     )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Input Url/)
    expect(rendered).to match(/Og Image Url/)
    expect(rendered).to match(/Job/)
    expect(rendered).to match(/Status/)
  end
end
