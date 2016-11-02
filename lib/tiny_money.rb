# frozen_string_literal: true

require 'tiny_money/version'
require 'bigdecimal'

# Public: module responsible to define Money tiny type and related methods
module TinyMoney
  class << self
    def money(value)
      Money.new(value)
    end
  end

  # Define class responsible to represent monetary values
  class Money
    def initialize(this)
      raise ArgumentError, "#{value} is not a number" unless number?(this)
      @this = BigDecimal(this.to_s)
    end

    def value
      @this.to_f
    end

    def +(other)
      wrap_new_value(@this + other)
    end

    def -(other)
      wrap_new_value(@this - other)
    end

    def *(other)
      wrap_new_value(@this * other)
    end

    def /(other)
      wrap_new_value(@this / other)
    end

    private

    def number?(num)
      !Float(num).nil?
    rescue ArgumentError
      false
    end

    def wrap_new_value(new_value)
      self.class.new(new_value)
    end
  end
end
