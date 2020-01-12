require 'rails_helper'

RSpec.describe "currencies/new", type: :view do
  before(:each) do
    assign(:currency, Currency.new(name: "MyString", code: "MyString", symbol: "MyString"))
  end

  it "renders new currency form" do
    render

    assert_select "form[action=?][method=?]", currencies_path, "post" do
      assert_select "input[name=?]", "currency[name]"
      assert_select "input[name=?]", "currency[code]"
      assert_select "input[name=?]", "currency[symbol]"
    end
  end
end
