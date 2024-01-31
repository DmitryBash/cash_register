# frozen_string_literal: true

module Rules
  class QuantityDiscount < Base
    def apply(product, count)
      return 0 unless @applicable_for_codes.include?(product.code)
      return 0 if count < 3

      (product.price - 4.50) * count
    end
  end
end
