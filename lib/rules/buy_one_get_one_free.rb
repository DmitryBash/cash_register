# frozen_string_literal: true

module Rules
  class BuyOneGetOneFree < Base
    def apply(product, count)
      return 0 unless @applicable_for_codes.include?(product.code)

      count >= 2 ? product.price * (count / 2) : product.price * count
    end
  end
end
