# frozen_string_literal: true

require 'checkout'
require 'product'
require 'rules/base'
require 'rules/buy_one_get_one_free'
require 'rules/fraction'
require 'rules/quantity_discount'

RSpec.describe Checkout do
  describe '#total' do
    let(:green_tea) { Product.new(code: 'GR1', name: 'Green Tea', price: 3.11) }
    let(:strawberries) { Product.new(code: 'SR1', name: 'Strawberries', price: 5.00) }
    let(:coffee) { Product.new(code: 'CF1', name: 'Coffee', price: 11.23) }

    let(:pricing_rules) do
      [
        Rules::BuyOneGetOneFree.new(applicable_for_codes: [green_tea.code]),
        Rules::Fraction.new(applicable_for_codes: [coffee.code], min_quantity: 3),
        Rules::QuantityDiscount.new(applicable_for_codes: [strawberries.code], new_price: 4.50, min_quantity: 3)
      ]
    end

    subject { described_class.new(pricing_rules) }

    context 'when basket containts GR1, GR1 products' do
      it 'calculates the basket value' do
        subject.add_product(green_tea)
        subject.add_product(green_tea)

        expect(subject.total).to eq(3.11)
      end
    end

    context 'when basket containts SR1, SR1, GR1, SR1 products' do
      it 'calculates the basket value' do
        subject.add_product(strawberries)
        subject.add_product(strawberries)
        subject.add_product(green_tea)
        subject.add_product(strawberries)

        expect(subject.total).to eq(16.61)
      end
    end

    context 'when basket containts GR1, CF1, SR1, CF1, CF1 products' do
      it 'calculates the basket value' do
        subject.add_product(green_tea)
        subject.add_product(coffee)
        subject.add_product(strawberries)
        subject.add_product(coffee)
        subject.add_product(coffee)

        expect(subject.total).to eq(30.57)
      end
    end

    context 'when rules are not applied' do
      it 'calculates the basket value' do
        subject.add_product(coffee)
        subject.add_product(strawberries)
        subject.add_product(coffee)

        expect(subject.total).to eq(27.46)
      end
    end
  end
end
