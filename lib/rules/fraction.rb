# frozen_string_literal: true

module Rules
  class Fraction < Base
    def apply(product, count)
      return 0 unless @applicable_for_codes.include?(product.code)

      count >= 3 ? (count * product.price * 2 / 3) : product.price * count
    end
  end
end
