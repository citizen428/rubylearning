require 'test/unit'
require 'test/unit/ui/console/testrunner'
require '04tomstuart'

class Polynomial_Test < Test::Unit::TestCase
  def setup
    @p1 = Polynomial.new([-3,-4,1,0,6])
    @p2 = Polynomial.new([1,0,2])
    @p3 = Polynomial.new([-1,-2,3,0])
    @p4 = Polynomial.new([0,0,0])
  end

  def test_first_negative
    assert_equal("-3x^4-4x^3+x^2+6", @p1.to_s) 
  end

  def test_simple
    assert_equal("x^2+2", @p2.to_s) 
  end

  def test_first_minus_one
    assert_equal("-x^3-2x^2+3x", @p3.to_s)
  end

  def test_all_zero
    assert_equal("0", @p4.to_s)
  end

  def test_error
    e = assert_raise(ArgumentError) { Polynomial.new([1]) }
    assert_match(/Need at least 2 coefficients/, e.message)
  end
end

Test::Unit::UI::Console::TestRunner.run(Polynomial_Test)
