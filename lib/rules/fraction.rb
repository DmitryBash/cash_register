# frozen_string_literal: true

module Rules
  class Fraction < Base
    def apply(product, product_quantity)
      return 0 unless applicable_for_codes.include?(product.code)
      return 0 if product_quantity < min_quantity

      calculated_price = product_quantity * product.price
      calculated_price - (calculated_price * 2 / 3)
    end
  end
end
