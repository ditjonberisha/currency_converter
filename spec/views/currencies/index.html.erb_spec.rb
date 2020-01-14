require 'rails_helper'

RSpec.describe "currencies/index", type: :view do
  before(:each) do
    assign(:currencies, [
      Currency.create!(name: "Name", code: "Code", symbol: "Symbol"),
      Currency.create!(name: "Name1", code: "Code1", symbol: "Symbol1")
    ])
  end

  it "renders a list of currencies" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 1
    assert_select "tr>td", text: "Code".to_s, count: 1
    assert_select "tr>td", text: "Symbol".to_s, count: 1

    assert_select "tr>td", text: "Name1".to_s, count: 1
    assert_select "tr>td", text: "Code1".to_s, count: 1
    assert_select "tr>td", text: "Symbol1".to_s, count: 1
  end
end
