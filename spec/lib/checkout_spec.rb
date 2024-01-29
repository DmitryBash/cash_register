require "checkout"
require "product"

RSpec.describe Checkout do
  describe "#total" do
    let(:green_tea) { Product.new(code: "GR1", name: "Green Tea", price: 3.11) }
    let(:strawberries) { Product.new(code: "SR1", name: "Strawberries", price: 5.00) }
    let(:coffee) { Product.new(code: "CF1", name: "Coffee", price: 11.23) }

    subject { described_class.new }

    context "when basket containts GR1, GR1 products" do
      it "calculates the basket value" do
        subject.add_product(green_tea)
        subject.add_product(green_tea)

        expect(subject.total).to eq(3.11)
      end
    end

    context "when basket containts SR1, SR1, GR1, SR1 products" do
      it "calculates the basket value" do
        subject.add_product(strawberries)
        subject.add_product(strawberries)
        subject.add_product(green_tea)
        subject.add_product(strawberries)

        expect(subject.total).to eq(16.61)
      end
    end

    context "when basket containts GR1, CF1, SR1, CF1, CF1 products" do
      it "calculates the basket value" do
        subject.add_product(green_tea)
        subject.add_product(coffee)
        subject.add_product(strawberries)
        subject.add_product(coffee)
        subject.add_product(coffee)

        expect(subject.total).to eq(30.57)
      end
    end
  end
end