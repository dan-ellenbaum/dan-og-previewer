require 'rails_helper'

RSpec.describe "og_previewers/new", type: :view do
  before(:each) do
    assign(:og_previewer, OgPreviewer.new(
      input_url: "MyString",
    ))
  end

  it "renders new og_previewer form" do
    render

    assert_select "form[action=?][method=?]", og_previewers_path, "post" do

      assert_select "input[name=?]", "og_previewer[input_url]"
    end
  end
end
