require 'rails_helper'

RSpec.describe "currencies/edit", type: :view do
  before(:each) do
    @currency = assign(:currency, Currency.create!(name: "Dollar", code: "USD", symbol: "$"))
  end

  it "renders the edit currency form" do
    render

    assert_select "form[action=?][method=?]", currency_path(@currency), "post" do
      assert_select "input[name=?]", "currency[name]"
      assert_select "input[name=?]", "currency[code]"
      assert_select "input[name=?]", "currency[symbol]"
    end
  end
end
