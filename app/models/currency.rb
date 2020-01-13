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

class Currency < ApplicationRecord
  has_many :rates, foreign_key: :from_currency_id, dependent: :destroy
  has_many :inverse_rates, class_name: 'Rate', foreign_key: :to_currency_id, dependent: :destroy

  validates :name, :code, presence: true, uniqueness: true

  def api_code
    code.upcase.to_s
  end

  def display_value
    "#{symbol} #{api_code} (#{name})"
  end
end
