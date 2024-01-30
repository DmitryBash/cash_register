# frozen_string_literal: true

class Checkout
  def initialize(rules)
    @basket = []
    @rules = rules
  end

  def add_product(product)
    @basket << product
  end

  def total
    total_price = 0
    product_counts = Hash.new(0)

    @basket.each { |product| product_counts[product] += 1 }
    product_counts.each do |product, count|
      total_price += @rules.sum { |rule| rule.apply(product, count) }
    end

    total_price.round(2)
  end
end
