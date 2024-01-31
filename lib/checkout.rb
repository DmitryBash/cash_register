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
    total_price = @basket.map(&:price).sum
    total_price -= calculate_items_discount

    total_price.round(2)
  end

  private

  def calculate_items_discount
    return 0 if @rules.empty?

    product_counts = @basket.each_with_object(Hash.new(0)) { |product, product_count| product_count[product] += 1 }
    discount_price = 0

    product_counts.each do |product, count|
      discount_price += @rules.sum { |rule| rule.apply(product, count) }
    end

    discount_price
  end
end
