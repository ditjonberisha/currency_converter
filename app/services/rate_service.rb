class RateService < BaseService
  attr_accessor :currencies
  attr_accessor :base_source

  def call
    return if currencies.nil?

    api_rates = CurrencyLayerService.call
    return if api_rates.blank?

    create_rates(api_rates)
  end

  private
    def create_rates(api_rates)
      currencies.each do |from_currency|
        currencies.each do |to_currency|
          next if from_currency == to_currency
          rate = Rate.find_or_initialize_by(from_currency: from_currency,
                                            to_currency: to_currency,
                                            date: Date.today)
          rate.value = rate_value(api_rates, from_currency, to_currency)
          rate.save
        end
      end
    end

    def rate_value(api_rates, from_currency, to_currency)
      if from_currency.api_code == @base_source
        api_rates[from_currency.api_code + to_currency.api_code]
      else
        api_rates['USD' + to_currency.api_code] / api_rates['USD' + from_currency.api_code]
      end
    end

    def currencies
      @currencies ||= params.fetch(:currencies, Currency.all)
    end

    def base_source
      @base_source ||= params.fetch(:base_source, 'USD')
    end
end
