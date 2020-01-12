class Currency < ApplicationRecord
  has_many :rates, foreign_key: :from_currency_id

  validates :name, :code, presence: true

  def api_code
    code.upcase.to_s
  end
end
