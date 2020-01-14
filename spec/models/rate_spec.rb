# == Schema Information
#
# Table name: rates
#
#  id               :bigint           not null, primary key
#  date             :date
#  value            :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  from_currency_id :bigint
#  to_currency_id   :bigint
#
# Indexes
#
#  index_rates_on_from_currency_id  (from_currency_id)
#  index_rates_on_to_currency_id    (to_currency_id)
#
# Foreign Keys
#
#  fk_rails_...  (from_currency_id => currencies.id)
#  fk_rails_...  (to_currency_id => currencies.id)
#

require 'rails_helper'

RSpec.describe Rate, type: :model do
  describe 'associations' do
    it 'should belong to from_currency' do
      should belong_to(:from_currency).class_name('Currency')
    end

    it 'should belong to to_currency' do
      should belong_to(:to_currency).class_name('Currency')
    end
  end

  describe '.convert_value' do
    it 'should return the same value if from and to are the same' do
      params = { from: 1, to: 1, value: 10 }
      expect(Rate.convert_value(params)).to eq(params[:value])
    end

    it 'should return N/A if rate is missing' do
      params = { from: 1, to: nil, value: 10 }
      expect(Rate.convert_value(params)).to eq('N/A')
    end

    it 'should return converted value' do
      from_currency = create(:currency, name: 'from', code: 'from')
      to_currency = create(:currency, name: 'to', code: 'to')
      rate = create(:rate, from_currency: from_currency, to_currency: to_currency, date: Date.today, value: 1.5)
      params = { from: from_currency.id, to: to_currency.id, value: 10 }
      exp_value = params[:value] * rate.value

      expect(Rate.convert_value(params)).to eq(exp_value)
    end
  end

  describe '.search' do
    it 'should return rates' do
      from_currency = create(:currency, name: 'from', code: 'from')
      to_currency = create(:currency, name: 'to', code: 'to')
      from_date = Date.today - 1.week
      to_date = Date.today
      rate = create(:rate, from_currency: from_currency, to_currency: to_currency, date: from_date)
      create(:rate, from_currency: from_currency, to_currency: to_currency, date: from_date - 1.day)
      params = { from_currency: from_currency, to_currency: to_currency, from_date: from_date, to_date: to_date }

      expect(Rate.search(params)).to eq([rate])
    end
  end
end
