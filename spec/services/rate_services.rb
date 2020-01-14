require 'rails_helper'

RSpec.describe RateService do
  describe 'call' do
    it 'should create rates' do
      currencies = [create(:currency, name: 'USD', code: 'USD'), create(:currency, name: 'EURO', code: 'EUR')]
      api_results = { "USDEUR" => 0.89, "USDUSD" => 1 }
      expect(CurrencyLayerService).to receive(:call).and_return(api_results)

      expect { RateService.call(currencies: currencies) }.to change(Rate, :count).by(2)
    end

    it 'should return if currencies blank' do
      currencies = []
      expect { RateService.call(currencies: currencies) }.to change(Rate, :count).by(0)
    end

    it 'should return if api response is blank' do
      currencies = [create(:currency, name: 'USD', code: 'USD'), create(:currency, name: 'EURO', code: 'EUR')]
      api_results = nil
      expect(CurrencyLayerService).to receive(:call).and_return(api_results)

      expect { RateService.call(currencies: currencies) }.to change(Rate, :count).by(0)
    end
  end
end
