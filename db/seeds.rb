# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Currency.create(name: 'United States Dollar', code: 'USD', symbol: '$')
Currency.create(name: 'EURO', code: 'EUR', symbol: '€')
Currency.create(name: 'Swiss Franc', code: 'CHF', symbol: 'CHF')
