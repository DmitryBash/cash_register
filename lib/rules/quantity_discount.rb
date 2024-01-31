# frozen_string_literal: true

module Rules
  class QuantityDiscount < Base
    def apply(product, product_quantity)
      return 0 unless applicable_for_codes.include?(product.code)
      return 0 if product_quantity < min_quantity

      (product.price - new_price) * product_quantity
    end
  end
end
