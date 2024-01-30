# frozen_string_literal: true

module Rules
  class QuantityDiscount < Base
    def apply(product, count)
      return 0 unless product.code == 'SR1'

      count >= 3 ? 4.50 * count : product.price * count
    end
  end
end
