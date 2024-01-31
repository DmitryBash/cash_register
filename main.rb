# frozen_string_literal: true

require_relative 'lib/checkout'

green_tea = Product.new(code: 'GR1', name: 'Green tea', price: 3.11)
strawberries = Product.new(code: 'SR1', name: 'Strawberries', price: 5.00)
coffee = Product.new(code: 'CF1', name: 'Coffee', price: 11.23)

rules = [
  Rules::BuyOneGetOneFree.new(applicable_for_codes: [green_tea.code]),
  Rules::Fraction.new(applicable_for_codes: [coffee.code], min_quantity: 3),
  Rules::QuantityDiscount.new(applicable_for_codes: [strawberries.code], new_price: 4.50, min_quantity: 3)
]

checkout = Checkout.new(rules)

checkout.add_product(strawberries)
checkout.add_product(strawberries)
checkout.add_product(green_tea)
checkout.add_product(strawberries)
checkout.add_product(coffee)

puts checkout.total
