class RatesController < ApplicationController
  before_action :set_currencies, only: :index

  def index
    @results = rates
  end

  protected
    def set_currencies
      @currencies = Currency.all
    end

    def rates
      params[:from_date] = params[:from_date].blank? ? Date.today - 1.week : Date.strptime(params[:from_date], "%Y-%m-%d")
      params[:to_date] = params[:to_date].blank? ? Date.today : Date.strptime(params[:to_date], "%Y-%m-%d")
      params[:from_currency] = params[:from_currency].blank? ? Currency.find_by(code: 'EUR')&.id : params[:from_currency]
      params[:to_currency] = params[:to_currency].blank? ? Currency.find_by(code: 'USD')&.id : params[:to_currency]

      Rate.search(params)
    end
end
