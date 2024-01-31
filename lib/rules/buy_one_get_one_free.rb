# frozen_string_literal: true

module Rules
  class BuyOneGetOneFree < Base
    def apply(product, count)
      return 0 unless applicable_for_codes.include?(product.code)

      product.price * (count / 2)
    end
  end
end
