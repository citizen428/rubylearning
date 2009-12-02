#!/usr/bin/env ruby
# --*-- encoding: UTF-8 --*--

# RPCFN: Ruby Fun (#4)
# @author 梁智敏(Gimi Liang) liang.gimi at gmail dot com
class Polynomial

  # Creates a new polynomial.
  # @override
  #   @param [Array<Integer>] coefficients
  #   @example
  #     Polynomial.new [1, 2, 3, 4]
  #
  # @override
  #   @param [Integer, ...] coefficients
  #   @example
  #     Polynomial.new 1, 2, 3, 4
  def initialize *args
    args.flatten!
    raise ArgumentError, "Need at least 2 coefficients" if args.size < 2
    @coefficients = args
  end

  # Returns a pretty-prints polynomial. 
  def to_s
    str =
      @coefficients.zip((0...@coefficients.size).to_a.reverse!).inject('') { |result, (n, e)|
        n =
          case n
          when 1
            '+'
          when -1
            '-'
          when 0
            next result
          else
            n > 0 ? "+#{n}" : n.to_s
          end

        e =
          case e
          when 1
            'x'
          when 0
            ''
          else
            "x^#{e}"
          end

        result << "#{n}#{e}"
      }.sub(/\A\+/, '')

    str.empty? ? '0=0' : str
  end

end

# -- TESTS ------------------------------------------------
if __FILE__ == $0
  require 'test/unit'
  require 'test/unit/ui/console/testrunner'
   
  class Polynomial_Test < Test::Unit::TestCase
    def setup
      @p1  = Polynomial.new([-3,-4,1,0,6])
      @p1a = Polynomial.new(-3,-4,1,0,6)
      @p2  = Polynomial.new([1,0,2])
      @p2a = Polynomial.new(1,0,2)
      @p3  = Polynomial.new([-1,-2,3,0])
      @p3a = Polynomial.new(-1,-2,3,0)
      @p4  = Polynomial.new([0,0,0])
      @p4a = Polynomial.new(0,0,0)
    end

    def test_first_negative
      assert_equal("-3x^4-4x^3+x^2+6", @p1.to_s) 
      assert_equal("-3x^4-4x^3+x^2+6", @p1a.to_s) 
    end

    def test_simple
      assert_equal("x^2+2", @p2.to_s) 
      assert_equal("x^2+2", @p2a.to_s) 
    end

    def test_first_minus_one
      assert_equal("-x^3-2x^2+3x", @p3.to_s)
      assert_equal("-x^3-2x^2+3x", @p3a.to_s)
    end

    def test_all_zero
      assert_equal("0=0", @p4.to_s)
      assert_equal("0=0", @p4a.to_s)
    end

    def test_error
      e = assert_raise(ArgumentError) { Polynomial.new([1]) }
      assert_match(/Need at least 2 coefficients/, e.message)

      e = assert_raise(ArgumentError) { Polynomial.new(1) }
      assert_match(/Need at least 2 coefficients/, e.message)
    end
  end

  Test::Unit::UI::Console::TestRunner.run(Polynomial_Test)
end