# frozen_string_literal: true

require_relative 'product'
require_relative 'rules/base'
require_relative 'rules/buy_one_get_one_free'
require_relative 'rules/fraction'
require_relative 'rules/quantity_discount'

class Checkout
  def initialize(rules)
    @basket = []
    @rules = rules
  end

  def add_product(product)
    @basket << product
  end

  def total
    total_price = @basket.map(&:price).sum
    total_price -= calculate_items_discount

    total_price.round(2)
  end

  private

  def calculate_items_discount
    return 0 if @rules.empty?

    discount_price = 0

    @basket.tally.each do |product, count|
      discount_price += @rules.sum { |rule| rule.apply(product, count) }
    end

    discount_price
  end
end
