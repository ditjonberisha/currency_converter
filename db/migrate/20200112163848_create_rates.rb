class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :from_currency, index: true, foreign_key: { to_table: :currencies }
      t.references :to_currency, index: true, foreign_key: { to_table: :currencies }
      t.float :value
      t.date :date

      t.timestamps
    end
  end
end
