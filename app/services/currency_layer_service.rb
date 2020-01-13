require 'money/bank/currencylayer_bank'

class CurrencyLayerService < BaseService
  API_KEY = ENV['CURRENCY_LAYER_API_KEY']

  def call
    get_results
  end

  private
    def get_results
      currency_layer_api = Money::Bank::CurrencylayerBank.new
      currency_layer_api.access_key = API_KEY
      currency_layer_api.update_rates
    rescue
      raise 'API results failed!'
    end
end
