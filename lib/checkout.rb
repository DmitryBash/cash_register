class Checkout
  def initialize
    @basket = []
  end

  def add_product(product)
    @basket << product
  end

  def total
    @basket.map(&:price).sum
  end
end
