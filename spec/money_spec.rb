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
end
