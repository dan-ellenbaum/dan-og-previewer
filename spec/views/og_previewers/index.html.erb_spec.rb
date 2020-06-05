require 'rails_helper'

RSpec.describe "og_previewers/index", type: :view do
  before(:each) do
    assign(:og_previewers, [
      OgPreviewer.create!(
        input_url: "Input Url",
        og_image_url: "Og Image Url",
        job_id: "Job",
        status: "Status"
      ),
      OgPreviewer.create!(
        input_url: "Input Url",
        og_image_url: "Og Image Url",
        job_id: "Job",
        status: "Status"
      )
    ])
  end

  it "renders a list of og_previewers" do
    render
    assert_select "tr>td", text: "Input Url".to_s, count: 2
    assert_select "tr>td", text: "Og Image Url".to_s, count: 2
    assert_select "tr>td", text: "Job".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
  end
end
