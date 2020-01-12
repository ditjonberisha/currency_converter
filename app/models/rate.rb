class Rate < ApplicationRecord
  belongs_to :from_currency, class_name: 'Currency', foreign_key: :from_currency_id
  belongs_to :to_currency, class_name: 'Currency', foreign_key: :to_currency_id

  def self.convert_value(params)
    from = params[:from]
    to = params[:to]
    value = params[:value].to_f

    return value if from == to

    rate = Rate.where(from_currency: from, to_currency: to, date: Date.today).first
    return 'N/A' if rate.nil?

    rate.value * value
  end
end
