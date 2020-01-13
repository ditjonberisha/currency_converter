# == Schema Information
#
# Table name: currencies
#
#  id         :bigint           not null, primary key
#  code       :string
#  name       :string
#  symbol     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Currency, type: :model do
  describe 'associations' do
    it 'should have many rates' do
      should have_many(:rates).class_name('Rate')
    end

    it 'should have many inverse_rates' do
      should have_many(:inverse_rates).class_name('Rate')
    end
  end

  describe 'validations' do
    it 'should validate presence of name' do
      should validate_presence_of(:name)
      should validate_uniqueness_of(:name)
    end

    it 'should validate presence of code' do
      should validate_presence_of(:code)
      should validate_uniqueness_of(:code)
    end
  end

  describe '#api_code' do
    it 'should return code in capital letter' do
      currency = build(:currency, code: 'usd')
      expect(currency.api_code).to eq('USD')
    end
  end

  describe '#display_value' do
    it 'should return select display value' do
      currency = build(:currency, name: 'Dollar', code: 'usd', symbol: '$')
      expect(currency.display_value).to eq('$ USD (Dollar)')
    end
  end
end
