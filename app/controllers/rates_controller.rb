class RatesController < ApplicationController
  def index
  end

  def results
    from = Currency.find_by(code: 'EUR')
    to = Currency.find_by(code: 'USD')
    @rates = Rate.where(from_currency: from, to_currency: to).order(:date).to_a
  end
end
