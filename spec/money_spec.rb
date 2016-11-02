# frozen_string_literal: true
require 'spec_helper'

describe TinyMoney::Money do
  subject(:ten_cents) { described_class.new(value) }
  let(:value) { 0.1 }

  it 'sums other numbers' do
    result = ten_cents + 0.2
    expect(result.value).to eq(0.3)
  end

  it 'subtracts other numbers' do
    result = ten_cents - 0.2
    expect(result.value).to eq(-0.1)
  end

  it 'multiplies other numbers' do
    result = ten_cents * 0.2
    expect(result.value).to eq(0.02)
  end

  it 'divides other numbers' do
    result = ten_cents / 0.2
    expect(result.value).to eq(0.5)
  end

  it 'loads money based on value' do
    loaded_money = described_class.load(value)
    expect(loaded_money.value).to eq(value)
  end

  it 'dumps value from money intance' do
    dumped_value = described_class.dump(ten_cents)
    expect(dumped_value).to eq(ten_cents.value)
  end

  it 'throws an ArgumentError when dumping object is not an money' do
    expect { described_class.dump(Integer) }.to raise_error(ArgumentError)
  end
end
