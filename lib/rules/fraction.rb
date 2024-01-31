# frozen_string_literal: true

module Rules
  class Fraction < Base
    def apply(product, count)
      return 0 unless @applicable_for_codes.include?(product.code)
      return 0 if count < 3

      calculated_price = count * product.price
      calculated_price - (calculated_price * 2 / 3)
    end
  end
end
