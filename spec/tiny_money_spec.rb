# frozen_string_literal: true

require 'spec_helper'

describe TinyMoney do
  it 'has a version number' do
    expect(TinyMoney::VERSION).not_to be nil
  end

  describe '.money' do
    subject(:money) { described_class.money(value) }

    context 'given the value is a valid string number' do
      let(:value) { '20.0' }

      it 'returns 20 bucks representation' do
        twenty_bucks = money

        expect(twenty_bucks.value).to eq(20.0)
      end
    end

    context 'given the value is a valid negative number' do
      let(:value) { '-20.0' }

      it 'returns -20 bucks representation' do
        minus_twenty_bucks = money

        expect(minus_twenty_bucks.value).to eq(-20.0)
      end
    end

    context 'given the value is a "broken" number' do
      let(:value) { '-0.000989' }

      it 'returns -0.000989 bucks representation' do
        change = money

        expect(change.value).to eq(-0.000989)
      end
    end

    context 'given the value is a float' do
      let(:value) { -0.000989 }

      it 'returns -0.000989 bucks representation' do
        change = money

        expect(change.value).to eq(-0.000989)
      end
    end

    context 'given the value is not a valid number' do
      let(:value) { 'not a number' }

      it 'raises ArgumentError' do
        expect { money }.to raise_error(ArgumentError)
      end
    end
  end
end
