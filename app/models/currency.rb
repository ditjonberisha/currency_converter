class Currency < ApplicationRecord
  has_many :rates, foreign_key: :from_currency_id

  validates :name, :code, presence: true
end
