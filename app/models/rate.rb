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

class Rate < ApplicationRecord
  belongs_to :from_currency, class_name: 'Currency', foreign_key: :from_currency_id
  belongs_to :to_currency, class_name: 'Currency', foreign_key: :to_currency_id

  def self.convert_value(params)
    value = params[:value].to_f

    return value if params[:from] == params[:to]

    rate = Rate.where(from_currency: params[:from], to_currency: params[:to], date: Date.today).first
    return 'N/A' if rate.nil?

    rate.value * value
  end

  def self.search(params)
    where('date >= :from_date and date <= :to_date and from_currency_id = :from_currency and to_currency_id = :to_currency',
          from_date: params[:from_date], to_date: params[:to_date], from_currency: params[:from_currency], to_currency: params[:to_currency]).order(:date)
  end
end
