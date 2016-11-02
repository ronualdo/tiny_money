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

    class << self
      # method to work with active record. Based on
      # https://www.viget.com/articles/how-i-used-activerecord-serialize-with-a-custom-data-tyApe
      def load(loaded_value)
        new(loaded_value)
      end

      def dump(obj)
        raise ArgumentError, argument_error_message(obj) unless obj.is_a?(self)
        obj.value
      end

      private

      def argument_error_message(obj)
        "Attribute was supposed to be a #{self}. but was #{obj.class}"
      end
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
