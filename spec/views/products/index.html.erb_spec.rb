require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        name: "Name",
        description: "MyText",
        price: "9.99",
        image_url: "Image Url"
      ),
      Product.create!(
        name: "Name",
        description: "MyText",
        price: "9.99",
        image_url: "Image Url"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "Image Url".to_s, count: 2
  end
end
