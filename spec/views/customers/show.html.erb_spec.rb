require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      name: "Name",
      street: "Street",
      state: "State",
      zip: "Zip",
      phone: "Phone",
      email: "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
  end
end
