# frozen_string_literal: true

module Rules
  class Base
    attr_reader :applicable_for_codes, :min_quantity, :new_price

    def initialize(applicable_for_codes:, min_quantity: 0, new_price: 0)
      @applicable_for_codes = applicable_for_codes
      @min_quantity = min_quantity
      @new_price = new_price
    end

    def apply(_product, _count)
      raise NotImplementedError, 'Subclasses must implement this method'
    end
  end
end
