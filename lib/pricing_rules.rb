# frozen_string_literal: true

class PricingRules
  def initialize(product_prices)
    @product_prices = product_prices
  end

  def get_price(product, count)
    case product.code
    when 'GR1'
      count >= 2 ? product.price * (count / 2) : product.price * count
    when 'SR1'
      count >= 3 ? 4.50 * count : product.price * count
    when 'CF1'
      count >= 3 ? (count * product.price * 2 / 3) : product.price * count
    else
      0
    end
  end
end
