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

FactoryBot.define do
  factory :rate do
  end
end
