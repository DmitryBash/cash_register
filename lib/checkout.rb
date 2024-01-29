# frozen_string_literal: true

require_relative 'pricing_rules'

class Checkout
  def initialize
    @basket = []
    @pricing_rules = PricingRules.new(product_prices)
  end

  def add_product(product)
    @basket << product
  end

  def total
    total_price = 0
    product_counts = Hash.new(0)

    @basket.each { |product| product_counts[product] += 1 }
    product_counts.each do |product, count|
      total_price += @pricing_rules.get_price(product, count)
    end

    total_price.round(2)
  end

  private

  def product_prices
    @basket.each_with_object({}) do |product, p_r|
      p_r[product.code] = product.price
    end
  end
end
