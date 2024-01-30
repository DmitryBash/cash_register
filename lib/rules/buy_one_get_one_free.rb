# frozen_string_literal: true

module Rules
  class BuyOneGetOneFree < Base
    def apply(product, count)
      return 0 unless product.code == 'GR1'

      count >= 2 ? product.price * (count / 2) : product.price * count
    end
  end
end
