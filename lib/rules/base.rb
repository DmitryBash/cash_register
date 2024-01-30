# frozen_string_literal: true

module Rules
  class Base
    def initialize(applicable_for_codes)
      @applicable_for_codes = applicable_for_codes
    end

    def apply(_product, _count)
      raise NotImplementedError, 'Subclasses must implement this method'
    end
  end
end
